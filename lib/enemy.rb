require_relative './player'

class Enemy < Player
  attr_reader :speed

  OffscreenBuffer = 5

  def initialize(initial_x, initial_y, ground, speed)
    super(initial_x, initial_y, ground)
    @speed = speed
  end

  def color
    case speed
    when 1
      Gosu::Color::WHITE
    when 2
      Gosu::Color::GREEN
    when 3
      Gosu::Color::YELLOW
    when 4
      Gosu::Color.new 255, 255, 153, 0
    when 5
      Gosu::Color::RED
    end
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

  def death_sound
    Media::EnemyDeath
  end

  def go_left
    @x_velocity = -speed
  end
end

