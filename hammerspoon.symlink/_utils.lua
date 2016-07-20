--
-- UTILS
--

-- Send an OSX notification from hammerspoon.
function notify(message)
  hs.notify.new({title="Hammerspoon", informativeText=message}):send()
end
