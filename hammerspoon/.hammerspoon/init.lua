require "_config"
utils = require "utils"
require "vpn"
require "window"

--- Reload hammerspoon config whenever one of its config files changes.
hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", function(files)
  for _,file in pairs(files) do
    if file:sub(-4) == ".lua" then
      hs.reload()
      utils.notify("Config reloaded")
      break
    end
  end
end):start()
