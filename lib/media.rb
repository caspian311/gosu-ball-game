module Media
  Pew = Gosu::Sample.new("media/pew.wav")
  Boink = Gosu::Sample.new("media/boink.wav")
  EnemyBoink = Gosu::Sample.new("media/enemy_boink.wav")
  EnemyDeath = Gosu::Sample.new("media/enemy_death.wav")

  Player = Gosu::Image.new("media/player.bmp")
  PlayerShadow = Gosu::Image.new("media/shadow.bmp")
  DeathAnimation = Gosu::Image::load_tiles("media/death.bmp", 25, 25)
end
