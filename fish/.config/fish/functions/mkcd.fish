function mkcd -d 'Create and move to a new directory.' -a name
    mkdir -p -- "$name" && cd "$name"
end
