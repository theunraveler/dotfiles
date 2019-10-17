--
-- UTILS
--

local module = {}

-- Send an OSX notification from hammerspoon.
function module.notify(message)
  hs.notify.show("Hammerspoon", "", message)
end

-- Format any variable as a string for printing to the console.
function module.dump(o)
  if type(o) == 'table' then
    local s = '{ '
    for k,v in pairs(o) do
      if type(k) ~= 'number' then k = '"'..k..'"' end
      s = s .. '['..k..'] = ' .. module.dump(v) .. ','
    end
    return s .. '} '
  else
    return tostring(o)
  end
end

-- Require a module, but return `nil` if it fails to load.
function module.prequire(name)
  local status, mod = pcall(require, name)
  if status then
    return mod
  else
    return nil
  end
end

return module
