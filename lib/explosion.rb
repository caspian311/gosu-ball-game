class Explosion
  FRAME_DELAY = 50

  attr_accessor :color

  def initialize(animation, sound, x, y, color)
    @animation = animation
    @x, @y = x, y
    @current_frame = 0
    @color = color
    sound.play
  end

  def update
    @current_frame += 1 if frame_expired?
  end

  def draw
    return if done?
    image = current_frame
    image.draw(
      @x,
      @y,
      ZOrder::Player, 1, 1, color)
  end

  def done?
    @done || @current_frame == @animation.size
  end

  private

  def current_frame
    @animation[@current_frame % @animation.size]
  end

  def frame_expired?
    now = Gosu::milliseconds
    @last_frame ||= now
    if (now - @last_frame) > FRAME_DELAY
      @last_frame = now
    end
  end
end
