require 'gosu'

class GameOverScreen
  attr_reader :color, :alpha, :game_over_text

  FadeOutRate = 2
  GameOverText = 'Game Over'
  GameOverTextSize = 40

  def initialize(window)
    @alpha = 0
    @color = Gosu::Color::NONE

    @game_over_text = Gosu::Image.from_text window, GameOverText, Gosu.default_font_name, GameOverTextSize
  end

  def update(continue)
    @alpha += FadeOutRate if @alpha < 255
    @color = Gosu::Color.new @alpha, 128, 128, 128
    @continue = continue
  end

  def draw
      Gosu::draw_rect 0, 0, Consts::WindowWidth, Consts::WindowHeight, color, ZOrder::GameOverBackground
      game_over_text.draw text_x, text_y, ZOrder::GameOverText if fully_displayed?
  end

  def fully_displayed?
    alpha >= 255
  end

  private

  def text_x
    (Consts::WindowWidth / 2) - (game_over_text.width / 2)
  end

  def text_y
    (Consts::WindowHeight / 2) - (GameOverTextSize / 2)
  end
end
