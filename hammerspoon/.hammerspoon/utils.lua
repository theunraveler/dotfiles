--
-- UTILS
--

local module = {}

-- Send an OSX notification from hammerspoon.
function module.notify(message)
  hs.notify.new({title="Hammerspoon", informativeText=message}):send()
end

return module
