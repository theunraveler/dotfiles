function venv -d 'Create/activate a virtualenv'
  argparse u/upgrade -- $argv
  or return

  set -l venv_path $PWD/$VIRTUALENV_DIR_NAME

  set -f venv_args
  set -l venv_help (python -m venv --help)
  if python -m venv --help | grep --quiet -- --upgrade-deps
    set --append -- venv_args --upgrade-deps
  end

  if not test -d $venv_path
    echo -n "Creating virtualenv..."
    python -m venv $venv_args $venv_path
    __green "done"
  else if set -ql _flag_upgrade
    echo -n "Virtualenv already exists, updating to current python..."
    python -m venv --upgrade $venv_args $venv_path
    __green "done"
  end

  __activate_venv --trust
end
