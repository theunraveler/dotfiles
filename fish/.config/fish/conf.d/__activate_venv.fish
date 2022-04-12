function __activate_venv --on-variable PWD --description "Automatically activate python venv"
  set -l venv_path $PWD/.venv

  if not test -d $venv_path; return; end

  set -l venv_hash (echo $venv_path | md5sum | awk '{print $1}')
  set -l trust_path $HOME/.cache/trusted_venvs/$venv_hash

  if test -f $trust_path
    # Already trusted
  else if read_confirm "Trust the virtualenv at $venv_path?"
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
  echo -n "Activated virtualenv at "
  set_color --bold green
  echo $venv_path
  set_color normal
end