local logger = hs.logger.new('spoons')

-- Taken from the SpoonInstall spoon, to bootstrap the SpoonInstall spoon from
-- scratch.

local function _x(cmd, errfmt, ...)
  local output, status = hs.execute(cmd)
  if status then
    local trimstr = string.gsub(output, "\n*$", "")
    return trimstr
  else
    logger.ef(errfmt, ...)
    return nil
  end
end

local function installSpoonInstall()
  url = "https://github.com/Hammerspoon/Spoons/raw/master/Spoons/SpoonInstall.spoon.zip"
  local urlparts = hs.http.urlParts(url)
  local status, body, headers = hs.http.get(url)
  local success = nil
  if (status < 100) or (status >= 400) then
    lmmogger.ef("Error downloading %s. Error code %d: %s", urlparts.absoluteString, status, body or "<none>")
  else
    -- Write the zip file to disk in a temporary directory
    local tmpdir = _x("/usr/bin/mktemp -d", "Error creating temporary directory to download new spoon.")
    if tmpdir then
      local outfile = string.format("%s/%s", tmpdir, urlparts.lastPathComponent)
      local f = assert(io.open(outfile, "w"))
      f:write(body)
      f:close()

      -- Check its contents - only one *.spoon directory should be in there
      output = _x(
        string.format("/usr/bin/unzip -l %s '*.spoon/' | /usr/bin/awk '$NF ~ /\\.spoon\\/$/ { print $NF }' | /usr/bin/wc -l", outfile),
        "Error examining downloaded zip file %s, leaving it in place for your examination.", outfile
      )
      if output then
        if (tonumber(output) or 0) == 1 then
          -- Uncompress the zip file
          local outdir = string.format("%s/Spoons", hs.configdir)
          if _x(
            string.format("/usr/bin/unzip -o %s -d %s 2>&1", outfile, outdir),
            "Error uncompressing file %s, leaving it in place for your examination.", outfile
          ) then
            -- And finally, install it using Hammerspoon itself
            logger.f("Downloaded and installed %s", urlparts.absoluteString)
            _x(string.format("/bin/rm -rf '%s'", tmpdir), "Error removing directory %s", tmpdir)
            success = true
          end
        else
          logger.ef("The downloaded zip file %s is invalid - it should contain exactly one spoon. Leaving it in place for your examination.", outfile)
        end
      end
    end
  end
  return success
end

-- END SpoonInstall bootstrap.

-- We need to init the global `spoon` variable here, because calls to
-- `hs.spoons.#` will fail without it.
--
-- TODO: File a bug in hammerspoon?
_G["spoon"] = {}

if not hs.spoons.isInstalled("SpoonInstall") then
  installSpoonInstall()
end

hs.loadSpoon("SpoonInstall")

local install = spoon.SpoonInstall
install:updateAllRepos()

--
-- Spoons
--

-- http://www.hammerspoon.org/Spoons/ReloadConfiguration.html
install:andUse("ReloadConfiguration", {start = true})

-- http://www.hammerspoon.org/Spoons/WindowHalfsAndThirds.html
install:andUse("WindowHalfsAndThirds", {
  hotkeys = {
    left_half = {{"cmd", "alt"}, "Left"},
    right_half = {{"cmd", "alt"}, "Right"},
    top_half = {{"cmd", "alt"}, "Up"},
    bottom_half = {{"cmd", "alt"}, "Down"},
    top_left = {{"cmd", "alt", "ctrl"}, "Up"},
    bottom_left = {{"cmd", "alt", "ctrl"}, "Left"},
    top_right = {{"cmd", "alt", "ctrl"}, "Right"},
    bottom_right = {{"cmd", "alt", "ctrl"}, "Down"},
    max = {{"cmd", "alt"}, "F"},
  }
})

-- http://www.hammerspoon.org/Spoons/TextClipboardHistory.html
install:andUse("TextClipboardHistory", {
  config = {paste_on_select = true, show_in_menubar = false},
  hotkeys = {toggle_clipboard = {{"cmd", "shift"}, "v"}},
  start = true,
})
