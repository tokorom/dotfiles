local function keyCode(key, modifiers)
   modifiers = modifiers or {}
   return function()
      hs.eventtap.event.newKeyEvent(modifiers, string.lower(key), true):post()
      hs.timer.usleep(1000)
      hs.eventtap.event.newKeyEvent(modifiers, string.lower(key), false):post()      
   end
end

local function remapKey(modifiers, key, keyCode)
   hs.hotkey.bind(modifiers, key, keyCode, nil, keyCode)
end

-- emacs mode
remapKey({'ctrl'}, 'm', keyCode('return'))

-- vi cursor
remapKey({'alt'}, 'h', keyCode('left'))
remapKey({'alt'}, 'l', keyCode('right'))
remapKey({'alt'}, 'j', keyCode('down'))
remapKey({'alt'}, 'k', keyCode('up'))

-- show desktop
remapKey({'alt'}, 'd', keyCode('f11'))
