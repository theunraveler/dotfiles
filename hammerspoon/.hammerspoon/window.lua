--
-- WINDOW MANAGEMENT
--

function windowResize(x, y, w, h)
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = x and x(max) or max.x
  f.y = y and y(max) or max.y
  f.w = w and w(max) or max.w
  f.h = h and h(max) or max.h
  win:setFrame(f)
end

-- Top half.
hs.hotkey.bind({"cmd", "alt"}, "Up", function()
  windowResize(nil, nil, nil, function(m)
    return m.h / 2
  end)
end)

-- Bottom half.
hs.hotkey.bind({"cmd", "alt"}, "Down", function()
  windowResize(
    nil,
    function(m) return m.h / 2 end,
    nil,
    function(m) return m.h / 2 end
  )
end)

-- Left half.
hs.hotkey.bind({"cmd", "alt"}, "Left", function()
  windowResize(
    nil,
    nil,
    function(m) return m.w / 2 end
  )
end)

-- Right half.
hs.hotkey.bind({"cmd", "alt"}, "Right", function()
  windowResize(
    function(m) return m.w / 2 end,
    nil,
    function(m) return m.w / 2 end
  )
end)

-- Upper left.
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Up", function()
  windowResize(
    nil,
    nil,
    function(m) return m.w / 2 end,
    function(m) return m.h / 2 end
  )
end)

-- Lower left.
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Left", function()
  windowResize(
    nil,
    function(m) return m.h / 2 end,
    function(m) return m.w / 2 end,
    function(m) return m.h / 2 end
  )
end)

-- Upper right.
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Right", function()
  windowResize(
    function(m) return m.w / 2 end,
    nil,
    function(m) return m.w / 2 end,
    function(m) return m.h / 2 end
  )
end)

-- Lower right.
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Down", function()
  windowResize(
    function(m) return m.w / 2 end,
    function(m) return m.h / 2 end,
    function(m) return m.w / 2 end,
    function(m) return m.h / 2 end
  )
end)

-- Full screen.
hs.hotkey.bind({"cmd", "alt"}, "F", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w
  f.h = max.h
  win:setFrame(f)
end)

-- Center.
hs.hotkey.bind({"cmd", "alt"}, "C", function()
  windowResize(
    function(m) return m.w / 4 end,
    function(m) return m.h / 4 end,
    function(m) return m.w / 2 end,
    function(m) return m.h / 2 end
  )
end)
