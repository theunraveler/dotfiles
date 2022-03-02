# For example:
#
#     git status --porcelain | grep '??' | with_args rm
#
# You can reliably substitute this function anywhere you could do
# `awk '{print $2}' | xargs`.
function with_args -d 'Convenience function to execute some action on the argument (read: second column) part of STDIN'
    awk '{print $2}' | xargs $argv
end
