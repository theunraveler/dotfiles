function wait_for_change -d 'Runs the given command repeatedly and stops when the value changes' -a cmd
  argparse 's/seconds=?' -- $argv
  or return

  if not set -ql _flag_seconds; set -f _flag_seconds 10; end

  set -f last_result (eval $cmd)
  echo "Starting value is $last_result"

  while true
    set -f result (eval $cmd)

    if test "$result" = "$last_result"
      echo "Value hasn't changed, checking again in $_flag_seconds seconds..."
      sleep $_flag_seconds
    else
      echo "Value has changed from $last_result to $result!"
      break
    end
  end
end
