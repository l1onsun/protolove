Battle = State("Battle")

function Battle:init()
  deck_left = {
    Game.unit_info.priest;
    Game.unit_info.priest;
    Game.unit_info.mage
  }

  deck_right = {
    Game.unit_info.mage;
    Game.unit_info.mage;
    Game.unit_info.priest;
  }
  
  -- place left
  y = SCREEN_HEIGHT / 2
  x = BORDERS + UNIT_WIDTH / 2
  
  for i, info in pairs(deck_left) do
    unit = Unit(Battle, info)
    unit.center = {x, y}
    unit.visible = true
    x = x + GAPS + UNIT_WIDTH
  end
  x = x - GAPS + BORDERS
  for i, info in pairs(deck_right) do
    unit = Unit(Battle, info)
    unit.center = {x, y}
    --unit.visible = true
    x = x + GAPS + UNIT_WIDTH
  end
  
end


function Battle:draw()
  Battle:draw_elements()
end

function Battle:enter(prev)
  print("Battle enter. Prev: ", prev)
end

function Battle:keypressed(key, code)
  if key == "escape" then
    Gamestate.switch(Game.states.menu)
  end
end

return Battle