require_relative './player'

class Enemy < Player
  OffscreenBuffer = 5

  def color
    Gosu::Color::RED
  end

  def off_screen?
    x <= -Size
  end

  def x_min
    -Size - OffscreenBuffer
  end

  def play_jumping_sound
    Media::EnemyBoink.play
  end
end

