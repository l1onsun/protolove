Battle = State()

function Battle:init()
  deck_left = {
    Game.unit_info.priest;
    Game.unit_info.priest;
    Game.unit_info.mage
  }

  deck_right = {
    Game.unit_info.mage;
    Game.unit_info.mage;
    Game.unit_info.mage
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
    unit.visible = true
    x = x + GAPS + UNIT_WIDTH
  end
  
end


function Battle:paint()
  --print("painted")
  --love.graphics.setColor(1, 1, 1, 1)
  --love.graphics.print({{1, 1, 0, 1}, "TEXT"}, 10, 10)
end

return Battle