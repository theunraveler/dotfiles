-- Implements a "dead man switch" with a USB device.
--
-- See https://tech.michaelaltfield.net/2020/01/02/buskill-laptop-kill-cord-dead-man-switch/.
utils = require "utils"
logger = hs.logger.new("deadman")

localConfig = utils.prequire("_local")
if not localConfig or not localConfig["DEADMAN_DEVICE_ID"] then
  logger.i("No deadman device defined, skipping watcher")
  return
end

hs.usb.watcher.new(function(event)
  if event.productID == localConfig["DEADMAN_DEVICE_ID"] and event.eventType == "removed" then
    logger.i("Deadman device removed! Locking computer!")
    hs.osascript.applescript([[
      tell application "System Events" to keystroke "q" using {control down, command down}
    ]])
  end
end):start()
