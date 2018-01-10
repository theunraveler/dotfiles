--
-- VPN automation
--
-- Does the following:
-- * Connects to VPN when switching to an unsecured network
-- * Disconnects from VPN when switching to a secured network
--
-- AppleScript comes from https://stackoverflow.com/a/32984473/197375
--

local utils = require "utils"
local logger = hs.logger.new("vpn")

localConfig = utils.prequire("_local")
if not localConfig then return end

function enableVPN()
  success, _, err = hs.osascript.applescript(string.format([[
    set vpn_name to "'%s'"

    tell application "System Events"
      set rc to do shell script "scutil --nc status " & vpn_name
      if not rc starts with "Connected" then
        do shell script "scutil --nc start " & vpn_name
      end if
    end tell
  ]], localConfig.VPN_NAME))

  if not success then logger.e(err) end
end

function disableVPN()
  success, _, err = hs.osascript.applescript(string.format([[
    set vpn_name to "'%s'"

    tell application "System Events"
      set rc to do shell script "scutil --nc status " & vpn_name
      if rc starts with "Connected" then
        do shell script "scutil --nc stop " & vpn_name
      end if
    end tell
  ]], localConfig.VPN_NAME))

  if not success then logger.e(err) end
end

hs.wifi.watcher.new(function(_, _, interface)
  local details = hs.wifi.interfaceDetails(interface)

  if not details["active"] then return end

  if details["security"] == "None" then
    hs.network.reachability.internet():setCallback(function(self, flags)
      if (flags & hs.network.reachability.flags.reachable) > 0 then
        enableVPN()
        self:stop()
      end
    end):start()
  elseif details["security"] ~= "Unknown" then
    disableVPN()
  end
end):start()
