function wait_until -d 'Runs the given command repeatedly and stops when the result equals the given value' -a cmd value
  argparse 'w/wait-time=?' -- $argv
  or return

  set -ql _flag_w
  or set -f _flag_w 10

  echo -n 'Waiting for '
  __green -n "$value"
  echo '...'

  while true
    set -f last_result (eval $cmd)

    if test "$last_result" = "$value"
      break
    else
      echo -n 'Value is '
      __green -n "$last_result"
      echo ", checking again in $_flag_w seconds..."
      sleep $_flag_w
    end
  end

  if type -q terminal-notifier
    terminal-notifier -title 'Wait Until' -subtitle 'Finished' -message "Value is now \"$value\""
  end
  echo -n 'Value is now '
  __green "$value"
end
