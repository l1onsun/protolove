return Class{ -- Ability
  __includes = Element;
    init = function(self, state, master, info)
      Element.init(self, state, nil, {SPELL_SIZE, SPELL_SIZE})
      self.master = master
      self.num = num
      self.image = love.graphics.newImage("images/"..info.image)
      self.quad = love.graphics.newQuad(0, 0, SPELL_SIZE / info.scale, SPELL_SIZE / info.scale, self.image:getDimensions())
      self.info = info
    end;
    
    inactive_draw = function(self)
      self.center = {
        self.master.border:left() + SPELL_SIZE / 2 + self.info.num*SPELL_SIZE;
        self.master.border:top() - SPELL_SIZE / 2
      }
      love.graphics.setColor(1, 1, 1, 1)
      love.graphics.draw(self.image, self.quad, self.border:left(), self.border:top(), 0, self.info.scale, self.info.scale)
    end;
  
    active_draw = function(self)
      self:inactive_draw()
      love.graphics.setColor(1, 1, 1, 0.4)
      love.graphics.rectangle("fill", self.border:left(), self.border:top(), self.width, self.height)
    end;
    
    is_visible = function(self)
      return self.master.abilities_status
    end;
}