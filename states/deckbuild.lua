Deckbuild = State()

function Deckbuild:init()
  unit1 = Unit(Battle, Game.unit_info.priest)
  unit1.center = {200, 200}
  unit1.visible = true
  
  unit2 = Unit(Battle, Game.unit_info.mage)
  unit2.center = {500, 200}
  unit2.visible = true
  leftSlots = {}
  rightSlots = {}
  
  
  for i = 1, 3 do
    
  end
  
end

return Deckbuild