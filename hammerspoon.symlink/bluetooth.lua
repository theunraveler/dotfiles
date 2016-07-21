--
-- CONTEXT
-- Sets various properties based on where I am.
--

local module = {}

local bluetooth = require("hs._asm.undocumented.bluetooth")

local function setBluetoothState(state)
  if not bluetooth.available() or bluetooth.power() == state then
    return
  end

  bluetooth.power(state)
end

-- Enable bluetooth if I'm connected to my display, otherwise disable it.
local checkForThunderboltDisplay = function()
  local displayConnected = hs.fnutils.some(hs.screen.allScreens(), function(screen)
    return screen:name() == "Thunderbolt Display"
  end)

  setBluetoothState(displayConnected)
end
hs.screen.watcher.new(checkForThunderboltDisplay):start()

checkForThunderboltDisplay(true)

return module
