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

  def hit?(shot)
    enemy_x_range = x.to_i...(x.to_i + Size)
    enemy_y_range = y.to_i...(y.to_i + Size)

    shot_x_range = shot.x.to_i...(shot.x.to_i + Shot::Length)
    shot_y_range = (shot.y.to_i - shot.y_offset.to_i)...(shot.y.to_i + shot.y_offset.to_i)

    enemy_x_range.overlaps? shot_x_range and enemy_y_range.overlaps? shot_y_range
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

