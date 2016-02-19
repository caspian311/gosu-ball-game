require 'gosu'

class GameWindow < Gosu::Window
  def initialize
    super Consts::WindowWidth, Consts::WindowHeight

    self.caption = "Bouncing Ball"

    @background = Background.new Gosu::Color.argb(0xff_2850e3)
    @ground = Ground.new Gosu::Color::GRAY
    @player = Player.new Consts::WindowWidth / 2, 
                          0, 
                          @ground
    @enemies = Enemies.new @ground
    @shots = Shots.new @player

    @kill_monitor = KillMonitor.new
    @score_board = ScoreBoard.new(self, @kill_monitor)
  end

  def update
    unless @player.dead?
      @player.go_left if left_pressed?
      @player.go_right if right_pressed?
      @player.jump if jump_pressed?
      @enemies.update
      @shots.shoot if shoot_pressed?

      @player.update
      @shots.update

      @kill_monitor.update @enemies, @shots, @player
    end
  end

  def draw
    @background.draw
    @ground.draw
    @player.draw
    @enemies.draw
    @shots.draw
    @score_board.draw
  end

  private

  def jump_pressed?
    Gosu::button_down? Gosu::KbSpace
  end

  def shoot_pressed?
    Gosu::button_down? Gosu::KbRightShift or Gosu::button_down? Gosu::KbLeftShift
  end

  def right_pressed?
    Gosu::button_down? Gosu::KbRight or Gosu::button_down? Gosu::GpRight
  end

  def left_pressed?
    Gosu::button_down? Gosu::KbLeft or Gosu::button_down? Gosu::GpLeft
  end

  def button_down(id)
    close if escape_pressed? id
  end

  def escape_pressed?(id)
    id == Gosu::KbEscape
  end
end

