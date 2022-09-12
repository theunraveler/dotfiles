function confirm --description 'Ask the user for confirmation' --argument prompt
    if test -z "$prompt"
        set prompt 'Confirm?'
    end

    while true
        read -p 'echo "$prompt (y/n): "' -l confirm

        switch $confirm
        case Y y
            return 0
        case '' N n
            return 1
        end
    end
end
