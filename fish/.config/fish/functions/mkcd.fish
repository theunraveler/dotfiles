# Create and move to a new directory.
function mkcd; mkdir -p -- "$argv" && cd -P -- "$argv"; end
