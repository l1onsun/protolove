return Class{ -- Unit
  __includes = Element;
  abilities_status = false;
  abilities = {};
  visible = true;

  init = function(self, state, info)
    Element.init(self, state, nil, {UNIT_WIDTH, UNIT_HEIGHT})
    self.info = info
    self.image = love.graphics.newImage("images/"..info.image)
    self.quad = love.graphics.newQuad(0, 0, UNIT_WIDTH / info.scale, UNIT_HEIGHT / info.scale, self.image:getDimensions())
    --self.spell_quad = love.graphics.newQuad(0, 0, SPELL_SIZE / info.scale, SPELL_SIZE / 
    self.health = info.health
    self.text_health = love.graphics.newText(Game.fonts.health, self.health)
    for spell_name, info in pairs(self.info.abilities) do
      self.abilities[spell_name] = Ability(state, self, info)
      --self.abilities[spell_name].image = love.graphics.newImage("images/"..value.image)
      --self.abilities[spell_name].quad = love.graphics.newQuad(0, 0, SPELL_SIZE / value.scale, 
      --  SPELL_SIZE / value.scale, 
      --  self.abilities[spell_name].image:getDimensions())
    end
  end;
  
  inactive_draw = function(self)
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.draw(self.image, self.quad, self.border:left(), self.border:top(), 0, self.info.scale, self.info.scale)
    self:show_bottom_bar()
    --self:show_abilities()
  end;
  
  active_draw = function(self)
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.draw(self.image, self.quad, self.border:left(), self.border:top(), 0, self.info.scale, self.info.scale)
    
    love.graphics.setColor(1, 1, 1, 0.4)
    love.graphics.rectangle("fill", self.border:left(), self.border:top(), self.width, self.height)
    self:show_bottom_bar()
    --self:show_abilities()
  end;
  
  show_bottom_bar = function(self)
    love.graphics.setColor(1, 0, 0, 1)
    love.graphics.draw(self.text_health, 
                       (self.border:right() + self.border:left() - self.text_health:getWidth()) / 2, 
                       self.border:bottom())
  end;
  
  is_visible = function(self)
    return self.visible
  end;
  
--  show_abilities = function(self)
--    if not self.abilities_status then
--      return
--    end
--    i = 0
--    for key, spell in pairs(self.abilities) do
--      --love.graphics.draw(spell.image, self.border:right(), self.border:top() + i * 200)
--      love.graphics.setColor(1, 1, 1, 1)
--      love.graphics.draw(spell.image, spell.quad, self.border:left() + (i * SPELL_SIZE), self.border:top() - SPELL_SIZE, 0, spell.scale, spell.scale)
--      i = i + 1
--    end
--  end;
  
  change_health = function(self, change)
    self.health = self.health + change
    self.text_health = love.graphics.newText(Game.fonts.health, self.health)
  end;
  
  click = function(self)
    self.abilities_status = not self.abilities_status
    self:change_health(1)
  end;
  
  drag_to = function(self, target)
  end;
}