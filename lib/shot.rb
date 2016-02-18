require_relative './position'

class Shot
  include Position

  attr_reader :initial_x

  Length = 30
  Height = 5

  def initialize(point)
    @x = point.x
    @initial_x = point.x
    @y = point.y
    @hit = false
  end

  def draw
    Gosu::draw_quad x, y - y_offset, Gosu::Color::RED,
      x + Length, y - y_offset, Gosu::Color::RED,
      x + Length, y, Gosu::Color::YELLOW,
      x, y, Gosu::Color::YELLOW,
      ZOrder::Shot
    Gosu::draw_quad x, y, Gosu::Color::YELLOW,
      x + Length, y, Gosu::Color::YELLOW,
      x + Length, y + y_offset, Gosu::Color::RED,
      x, y + y_offset, Gosu::Color::RED,
      ZOrder::Shot
  end

  def width
    Length
  end

  def height
    Height
  end

  def y_offset
    Height / 2
  end

  def hit_something
    @hit = true
  end

  def hit_something?
    @hit
  end

  def off_screen
    x > Consts::WindowWidth
  end
end


