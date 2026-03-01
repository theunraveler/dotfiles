# Disable greeting
set fish_greeting

# Starship
if type -q starship
  eval (starship init fish)
end
