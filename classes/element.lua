return Class{
  init = function(self, state, center , box)
    self.state = state
    self.center = center or {0, 0}
    local box = box or {10, 10}
    self.width = box[1]
    self.height = box[2]
    self.border = {
      _self = self;
      left =   function(self) return self._self.center[1] - 0.5*self._self.width  end;
      right =  function(self) return self._self.center[1] + 0.5*self._self.width  end;
      top =    function(self) return self._self.center[2] - 0.5*self._self.height end;
      bottom = function(self) return self._self.center[2] + 0.5*self._self.height end;
    }
      
    state:add_element(self)
  end;
    
  _active = function(self)
    if self.state.active_found then
      return false
    end
    mx, my = love.mouse.getPosition()
    if mx > self.border:left() and mx < self.border:right() and
       my > self.border:top() and my < self.border:bottom() then
      self.state.active_found = true
      self.state.active = self
      return true
    else 
      if self.state.active == self  then
        self.state.active = nil
      end
      return false
    end
  end;
  
  draw = function(self)
    if self:_active() then
      self:active_draw()
    else
      self:inactive_draw()
    end
  end;
  
  active_draw = function(self)
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.rectangle("fill", self.border:left(), self.border:top(), self.width, self.height)
  end;
  
  inactive_draw = function(self)
    love.graphics.setColor(0.5, 0.5, 0.5, 1)
    love.graphics.rectangle("fill", self.border:left(), self.border:top(), self.width, self.height)
  end;
  
  click = function(self)
  end;
  
  drag_to = function(self, target)
  end;
}