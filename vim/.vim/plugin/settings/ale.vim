let g:ale_open_list = 1

let g:ale_echo_msg_format = '[%linter%] %s'

let g:ale_python_autopep8_executable = $VIRTUAL_ENV . '/bin/autopep8'
let g:ale_python_flake8_executable = $VIRTUAL_ENV . '/bin/flake8'
let g:ale_python_pylint_executable = $VIRTUAL_ENV . '/bin/pylint'
