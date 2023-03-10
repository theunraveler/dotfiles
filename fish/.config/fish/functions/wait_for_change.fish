function wait_for_change -d 'Runs the given command repeatedly and stops when the value changes' -a cmd
  argparse 'w/wait-time=?' 'v/value=?' -- $argv
  or return

  set -ql _flag_w
  or set -f _flag_w 10

  set -ql _flag_value
  or set -f _flag_value (eval $cmd)

  echo -n 'Waiting for change from initial value '
  __green -n "$_flag_value"
  echo '...'

  while true
    set -f last_result (eval $cmd)

    if test "$last_result" = "$_flag_value"
      echo "Value hasn't changed, checking again in $_flag_w seconds..."
      sleep $_flag_w
    else
      break
    end
  end

  if type -q terminal-notifier
    terminal-notifier -title 'Wait for Change' -subtitle 'Output Changed' -message "Value has changed from \"$_flag_value\" to \"$last_result\""
  end
  echo -n 'Value has changed from '
  __green -n "$_flag_value"
  echo -n ' to '
  __green "$last_result"
end
