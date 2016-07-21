--
-- LAST.FM
--

-- Start the Last.fm app when iTunes opens, quit when it closes.
hs.application.watcher.new(function(appName, event, app)
  if appName ~= "iTunes" then
    return
  end

  if event == hs.application.watcher.launched then
    hs.application.open("Last.fm")
  elseif event == hs.application.watcher.terminated then
    local lastfm = hs.application.find("Last.fm")
    return lastfm and lastfm:kill()
  end
end):start()
