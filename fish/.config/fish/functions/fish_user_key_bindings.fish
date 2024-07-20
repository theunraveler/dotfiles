function fish_user_key_bindings
  fzf --fish | source

  # https://github.com/theunraveler/zsh-fancy_ctrl_z
  bind \cZ 'fg'

  # https://github.com/oh-my-fish/plugin-bang-bang
  bind ! __history_previous_command
  bind '$' __history_previous_command_arguments
end
