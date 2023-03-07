function __activate_venv --on-variable PWD --description "Automatically activate python venv"
  set -l venv_path $PWD/$VIRTUALENV_DIR_NAME

  if not test -d $venv_path; return; end
  if not confirm_trusted "$HOME/.cache/trusted_venvs" "$venv_path/pyvenv.cfg" --item=virtualenv --dir $argv; return; end

  source $venv_path/bin/activate.fish
  if test -f $PWD/Pipfile
    set -x PIPENV_ACTIVE 1
  else if test -f $PWD/pyproject.toml
    set -x POETRY_ACTIVE 1
  end
  __green "Activated virtualenv"
end
