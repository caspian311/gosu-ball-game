require_relative './player'

class Enemy < Player
  OffscreenBuffer = 5

  attr_accessor :dying, :dead
  alias :dying? :dying
  alias :dead? :dead

  def initialize(initial_x, initial_y, ground)
    super
    @dying = false
  end

  def draw
    unless dying?
      super
    else
      @explostion.draw
    end
  end

  def draw_player_image
    Media::Player.draw @x, @y, ZOrder::Player, 1, 1, Gosu::Color::RED
  end

  def update
    unless dying?
      super
    else
      @explostion.update
      @dead = @explostion.done?
    end
  end

  def kill
    @dying = true
    @explostion = Explosion.new Media::DeathAnimation, Media::EnemyDeath, x, y
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

