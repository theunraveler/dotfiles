--
-- VPN automation
--
-- Does the following:
-- * Connects to VPN when switching to an unsecured network
-- * Disconnects from VPN when switching to a secured network
--
-- AppleScript comes from https://stackoverflow.com/a/32984473/197375
--

local status, localConfig = pcall(require, "_local")
if not status then return end

local utils = require "utils"
local logger = hs.logger.new("vpn")

local current_timer = nil

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

local watcher = hs.wifi.watcher.new(function(_, _, interface)
  local details = hs.wifi.interfaceDetails(interface)

  if not details["active"] then return end

  if current_timer then
    current_timer:stop()
    current_timer = nil
  end

  if details["security"] == "None" then
    current_timer = hs.timer.doAfter(5, enableVPN)
  elseif details["security"] ~= "Unknown" then
    disableVPN()
  end
end)
watcher:start()
