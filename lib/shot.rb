class Shot
  attr_accessor :x
  attr_reader :y, :initial_x

  Length = 30
  Height = 5

  def initialize(x, y)
    @x = x
    @initial_x = x
    @y = y
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

  def top_left
    return x, y - y_offset
  end

  def bottom_right
    return x + Length, y + y_offset
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


