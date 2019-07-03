UNIT_HEIGHT = 240
UNIT_WIDTH = 150
SCREEN_HEIGHT = 600
SCREEN_WIDTH = 1200
GAPS = 15
BORDERS = (SCREEN_WIDTH - 4*GAPS - 6*UNIT_WIDTH) / 3


Class = require "hump.class"
Gamestate = require "hump.gamestate"

State = require "classes.state" 
Element = require "classes.element"
Unit = require "classes.unit"


Game = {
    states = {
      menu = require "states.menu";
      battle = require "states.battle";
    };
    unit_info = {
      priest = require "units.priest";
      mage = require "units.mage";
    };
    fonts = {
      health = love.graphics.newFont("17383.otf", 25)
    }
}

function love.load()
  love.window.setMode(SCREEN_WIDTH, SCREEN_HEIGHT, {})
  --love.graphics.setBlendMode("multiply", 'premultiplied')
  love.graphics.setBlendMode("add")
  Gamestate.registerEvents()
  Gamestate.switch(Game.states.battle)
end
