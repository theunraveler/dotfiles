function venv -d '(Create and) activate a virtualenv' -a name
  if not test -d ./.venv
    python -m venv .venv
  end
  source ./.venv/bin/activate.fish
  set_color --bold green
  echo "Activated virtualenv"
  set_color normal
end
