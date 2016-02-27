require 'gosu'
require_relative './position'

class Player
  include CollisionDetection
  include Position

  attr_accessor :dying, :dead
  alias :dying? :dying
  alias :dead? :dead

  Size = 25

  MaxSpeed = 4
  JumpForce = 7

  ShadowOffset = 20

  MaxLeft = 0
  MaxRight = Consts::WindowWidth - Size

  def initialize(initial_x, initial_y, ground)
    @x = initial_x
    @y = initial_y
    @ground = ground

    @x_velocity = @y_velocity = 0.0
    @dying = false
  end

  def width
    Size
  end

  def height
    width
  end

  def firing_position
    Point.new bottom_right.x, top_right.y + height / 2
  end

  def go_left
    @x_velocity -= 0.1 if @x_velocity > -MaxSpeed
  end

  def go_right
    @x_velocity += 0.1 if @x_velocity > -MaxSpeed
  end

  def jump
    if at_ground_level?
      @y_velocity = -JumpForce 
      play_jumping_sound
    end
  end

  def update
    unless dying?
      update_x
      update_y
    else
      @explostion.update
      @dead = @explostion.done?
    end
  end

  def draw
    unless dying?
      Media::Player.draw @x, @y, ZOrder::Player, 1, 1, color
      Media::PlayerShadow.draw @x, y_min + ShadowOffset, ZOrder::Shadow
    else
      @explostion.draw
    end
  end

  def kill
    @dying = true
    @explostion = Explosion.new Media::DeathAnimation, death_sound, x, y, color
  end

  private

  def death_sound
    Media::PlayerDeath
  end

  def play_jumping_sound
    Media::Boink.play
  end

  def update_x
    @x_velocity *= 0.96
    attempted_x = @x
    attempted_x += @x_velocity

    @x = attempted_x if can_move_to? attempted_x
  end

  def update_y
    if at_ground_level? and @y_velocity >= 0
      @y_velocity = 0
      return
    end

    @y_velocity += 0.2

    @y += @y_velocity

    @y = y_min if @y > y_min
  end

  def can_move_to?(attempted_x)
    attempted_x >= x_min and attempted_x <= MaxRight and not_in_a_wall(attempted_x)
  end

  def x_min
    MaxLeft
  end

  def not_in_a_wall(attempted_x)
    @y <= @ground.level_at(attempted_x) and @y <= @ground.level_at(attempted_x + width)
  end

  def at_ground_level?
    @y >= y_min
  end

  def y_min
    [@ground.level_at(@x + width), @ground.level_at(@x)].min
  end

  def color
    Gosu::Color::BLUE
  end
end
