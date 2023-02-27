function SetColour(choice)
  -- accepts both number as well as string
  choice = choice and tonumber(choice) or choice -- returns a number if the choic is a number or string.

  -- Define your cases
  case = {
    ayu = function() -- case ayu :
      require('colors-config.ayu')
    end, -- break statement

    doomone = function() -- case doomone :
      require('colors-config.doom-one')
    end, -- break statement

    material = function() -- case material:
      require('colors-config.material')
    end, -- break statement

    papercolor = function() -- case papercolor:
      require('colors-config.papercolor')
    end, -- break statement

    solarized = function() -- case solarized:
      require('colors-config.solarized')
    end, -- break statement

    tokyonight = function() -- case tokyonight:
      require('colors-config.tokyonight')
    end, -- break statement

    zephyr = function() -- case zephyr:
      require('colors-config.zephyr')
    end, -- break statement

    default = function() -- default case
      SetColour('solarized')
    end -- u cant exclude end hear :-P
  }

  -- execution section
  if case[choice] then
    case[choice]()
  else
    case["default"]()
  end

end

SetColour('tokyonight')
