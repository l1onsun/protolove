return Class{ -- State
  elements = {};
  active_found = false;
  active = nil;
  holded = nil;
  
  init = function(self, name)
    self.name = name
  end;
  
  add_element = function(self, el)
    table.insert(self.elements, el)
  end;
  
  draw_elements = function(self)
    self.active_found = false
    for i, el in pairs(self.elements) do
      el:draw()
    end
  end;
  
  mousepressed = function(self, x, y, button, isTouch)
    if button == 1 and self.active then
      self.active:click()
      self.holded = self.active
    end
  end;
  
  mousereleased = function(self, x,y, button)
    if button == 1 and self.holded then
      self.holded:drag_to(self.active)
    end
  end;
}