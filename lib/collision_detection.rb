module CollisionDetection
  def hit?(other)
    x_overlaps?(other) and y_overlaps?(other)
  end

  private

  def x_overlaps?(other)
    top_left.x <= other.top_right.x and 
      top_right.x >= other.top_left.x
  end

  def y_overlaps?(other)
    top_left.y <= other.bottom_left.y and 
      bottom_left.y >= other.top_left.y
  end
end
