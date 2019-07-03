return Class{
  __includes = Element;
  visible = false;
  init = function(self, state, info)
    Element.init(self, state, nil, {UNIT_WIDTH, UNIT_HEIGHT})
    self.info = info
    self.image = love.graphics.newImage("images/"..info.image)
    self.quad = love.graphics.newQuad(0, 0, UNIT_WIDTH / info.scale, UNIT_HEIGHT / info.scale, self.image:getDimensions())
    self.health = info.health
    self.text_health = love.graphics.newText(Game.fonts.health, self.health)
  end;
  
  inactive_draw = function(self)
    if not self.visible then
      return
    end
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.draw(self.image, self.quad, self.border:left(), self.border:top(), 0, self.info.scale, self.info.scale)
    self:show_bottom_bar()
  end;
  
  active_draw = function(self)
    if not self.visible then
      return
    end
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.draw(self.image, self.quad, self.border:left(), self.border:top(), 0, self.info.scale, self.info.scale)
    --love.graphics.draw(self.image, self.quad, self.border:left(), self.border:top())
    love.graphics.setColor(1, 1, 1, 0.4)
    love.graphics.rectangle("fill", self.border:left(), self.border:top(), self.width, self.height)
    self:show_bottom_bar()
  end;
  
  show_bottom_bar = function(self)
    love.graphics.setColor(1, 0, 0, 1)
    love.graphics.draw(self.text_health, 
                       (self.border:right() + self.border:left() - self.text_health:getWidth()) / 2, 
                       self.border:bottom())
  end;
  
  show_stats = function(self)
  end;
  
  click = function(self)
  end;
  
  drag_to = function(self, target)
  end;
}