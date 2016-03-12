require 'gosu'

class GameOverScreen
  attr_reader :color, :alpha, :game_over_text, :continue_text

  FadeOutRate = 2
  GameOverText = 'Game Over'
  ContinueText = 'Press the space bar to continue.'
  GameOverTextSize = 40
  ContinueTextSize = 20

  def initialize(window)
    @alpha = 0
    @color = Gosu::Color::NONE

    @game_over_text = Gosu::Image.from_text window, GameOverText, Gosu.default_font_name, GameOverTextSize
    @continue_text = Gosu::Image.from_text window, ContinueText, Gosu.default_font_name, ContinueTextSize
  end

  def update(continue)
    @alpha += FadeOutRate if @alpha < 255
    @color = Gosu::Color.new @alpha, 128, 128, 128
    @continue = continue
  end

  def draw
      Gosu::draw_rect 0, 0, Consts::WindowWidth, Consts::WindowHeight, color, ZOrder::GameOverBackground
      game_over_text.draw game_over_text_x, game_over_text_y, ZOrder::GameOverText if fully_displayed?
      continue_text.draw continue_text_x, continue_text_y, ZOrder::GameOverText if fully_displayed?
  end

  def fully_displayed?
    alpha >= 255
  end

  private

  def continue_text_x
    (Consts::WindowWidth / 2) - (continue_text.width / 2)
  end

  def continue_text_y
    (Consts::WindowHeight / 2) + ContinueTextSize
  end

  def game_over_text_x
    (Consts::WindowWidth / 2) - (game_over_text.width / 2)
  end

  def game_over_text_y
    (Consts::WindowHeight / 2) - GameOverTextSize
  end
end
