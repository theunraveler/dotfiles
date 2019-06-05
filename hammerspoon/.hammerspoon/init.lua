require "_config"
utils = require "utils"
require "vpn"
require "window"

--- Reload hammerspoon config whenever one of its config files changes.
hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", function(files)
  doReload = false
  for _,file in pairs(files) do
    if file:sub(-4) == ".lua" then
      doReload = true
    end
  end
  if doReload then
    hs.reload()
    utils.notify("Config reloaded")
  end
end):start()
