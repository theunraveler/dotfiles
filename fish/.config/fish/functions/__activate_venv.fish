function __activate_venv --on-variable PWD --description "Automatically activate python venv"
  set -l venv_path $PWD/$VIRTUALENV_DIR_NAME

  if not test -d $venv_path; return; end

  argparse a/auto-confirm -- $argv
  or return

  set -l venv_hash (md5sum "$venv_path/pyvenv.cfg" | awk '{print $1}')
  set -l trust_path "$HOME/.cache/trusted_venvs/$venv_hash"

  if test -f $trust_path
    # Already trusted
  else if set -ql _flag_auto-confirm
    or confirm "Trust the virtualenv at $venv_path?"
    mkdir -p (dirname $trust_path)
    touch $trust_path
  else
    return
  end

  source $venv_path/bin/activate.fish
  if test -f $PWD/Pipfile
    set -x PIPENV_ACTIVE 1
  else if test -f $PWD/pyproject.toml
    set -x POETRY_ACTIVE 1
  end
  __green "Activated virtualenv"
end
