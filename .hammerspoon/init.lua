local function keyCode(key, modifiers)
  modifiers = modifiers or {}
  return function()
    hs.eventtap.event.newKeyEvent(modifiers, string.lower(key), true):post()
    hs.timer.usleep(1000)
    hs.eventtap.event.newKeyEvent(modifiers, string.lower(key), false):post()      
  end
end

local function remapKey(modifiers, key, keyCode, needRepeat)
  repeatfn = needRepeat and keyCode or nil
  hs.hotkey.bind(modifiers, key, keyCode, nil, repeatfn)
end

-- emacs mode
remapKey({'ctrl'}, 'm', keyCode('return'), true)

-- vi cursor
remapKey({'alt'}, 'h', keyCode('left'), true)
remapKey({'alt'}, 'l', keyCode('right'), true)
remapKey({'alt'}, 'j', keyCode('down'), true)
remapKey({'alt'}, 'k', keyCode('up'), true)

-- show desktop
remapKey({'alt'}, 'd', keyCode('f11'), false)

-- alternate escape key
remapKey({'ctrl'}, ';', keyCode('escape'), false)
