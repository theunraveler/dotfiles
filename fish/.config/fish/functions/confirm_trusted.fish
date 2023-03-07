function confirm_trusted --description "Confirm whether the given file is trusted (for execution, etc)" -a store file
  argparse 'T/trust' 'd/dir' 'i/item=?' -- $argv
  or return

  set -l hash (md5sum "$file" | awk '{print $1}')
  set -l trust_path "$store/$hash"

  # Already trusted
  if test -f $trust_path; return; end

  if set -ql _flag_dir
    set -f file_ref (dirname "$file")
  else
    set -f file_ref $file
  end

  if set -ql _flag_item
    set -f item $_flag_item
  else
    set -g item file
  end

  if not set -ql _flag_trust
    and not confirm "Trust the $item at $file_ref?"
    return 1
  end

  mkdir -p "$store"
  touch $trust_path
end
