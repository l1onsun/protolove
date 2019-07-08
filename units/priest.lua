return {
  image = "priest.jpg";
  scale = 0.3;
  health = 10;
  abilities = {
    heal = {
      image = "heal.png"; -- love.graphics.newImage("images/heal.png"); -- "heal.png"
      scale = 1;
      num = 0;
      --quad = love.graphics.newQuad(0, 0, SPELL_SIZE / 0.3, SPELL_SIZE / 0.3, image:getDimensions())
    };
    heal2 = {
      image = "mage.jpg"; -- love.graphics.newImage("images/heal.png"); -- "heal.png"
      scale = 1;
      num = 1;
      --quad = love.graphics.newQuad(0, 0, SPELL_SIZE / 0.3, SPELL_SIZE / 0.3, image:getDimensions())
    }
  }
}