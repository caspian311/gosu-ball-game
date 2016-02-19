require 'Gosu'
require_relative './position'

class ScoreBoard
  include Position

  attr_accessor :window, :kill_monitor, :image

  def initialize(window, kill_monitor)
    @window = window
    @kill_monitor = kill_monitor
    @image = nil
    @x = 0
    @y = 0
  end

  def update
    @image = Gosu::Image::from_text(window, "SCORE: #{kill_monitor.kill_count}", Gosu.default_font_name, 30)
  end

  def draw
    image.draw(top_left.x, top_left.y, ZOrder::ScoreBoard) 
  end

  def width
    image == nil ? 0 : image.width
  end

  def height
    image == nil ? 0 : image.height
  end
end
