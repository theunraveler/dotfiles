function __deactivate_venv --on-variable PWD --description "Automatically deactivate python venv"
    if test -z $VIRTUAL_ENV; return; end
    echo $VIRTUAL_ENV

    set -l venv_path (string replace $VIRTUAL_ENV "/.venv")
    echo $venv_path

    if string match --quiet $venv_path $PWD; return; end

    deactivate
    echo -n "Deactivated virtualenv at "
    set_color --bold green
    echo $venv_path
    set_color normal
end