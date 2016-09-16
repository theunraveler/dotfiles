--
-- Spotify config
--

-- Start the Spotifree app when Spotify opens, quit when it closes.
hs.application.watcher.new(function(appName, event, app)
  if appName ~= "Spotify" then
    return
  end

  if event == hs.application.watcher.launched then
    hs.application.open("Spotifree")
  elseif event == hs.application.watcher.terminated then
    local spotifree = hs.application.find("Spotifree")
    return spotifree and spotifree:kill()
  end
end):start()
