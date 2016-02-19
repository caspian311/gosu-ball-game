require 'Gosu'
require_relative './position'

class ScoreBoard
  include Position

  attr_accessor :window, :kill_monitor

  def initialize(window, kill_monitor)
    @window = window
    @kill_monitor = kill_monitor
  end

  def draw
    image = Gosu::Image::from_text(window, "SCORE: #{kill_monitor.kill_count}", Gosu.default_font_name, 30)
    image.draw(0, 0, ZOrder::ScoreBoard) 
  end
end
