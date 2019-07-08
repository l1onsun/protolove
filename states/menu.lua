local Menu = State("Menu")

function Menu:draw()
  if Menu.prev then
    Menu.prev:draw()
  end
  Menu:draw_elements()
  love.graphics.print("Menu", 0, 100)
  love.graphics.print("press escape to return", 50, 100)
end

function Menu:enter(prev)
  Menu.prev = prev
end

function Menu:keypressed(key, code)
  if key == "escape" then
    Gamestate.switch(Game.states.battle)
  end
end

--function menu:update(dt)
--end


return Menu