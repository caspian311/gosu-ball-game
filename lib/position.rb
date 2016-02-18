module Position
  attr_accessor :x, :y

  def top_left
    Point.new(x, y)
  end

  def top_right
    Point.new(x + width, y)
  end

  def bottom_left
    Point.new(x, y + height)
  end

  def bottom_right
    Point.new(x + width, y + height)
  end
end

