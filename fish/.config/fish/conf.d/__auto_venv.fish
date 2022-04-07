function __auto_venv --on-variable PWD --description "Automatically activate python venv"
    set -l venv_name (basename $PWD | tr . -)
  
    if test -d $HOME/.virtualenvs/$venv_name
      source $HOME/.virtualenvs/$venv_name/bin/activate.fish
      echo "Activated $venv_name virtualenv"
    end
  end