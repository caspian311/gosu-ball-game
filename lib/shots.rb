class Shots
  attr_reader :player
  attr_reader :shots

  ShotSpeed = 5
  DistanceBeforeShootingAgain = 125

  def initialize(player)
    @shots = []
    @player = player
  end

  def shoot
    return if shooting?

    Media::Pew.play
    shots << Shot.new(player.firing_position)
  end

  def update
    shots.each do |shot|
      shot.x += ShotSpeed
    end
    shots.delete_if { |shot| shot.off_screen or shot.hit_something? }
  end

  def each
    shots.each do |shot|
      yield shot
    end
  end

  def draw
    shots.each do |shot|
      shot.draw
    end
  end

  private 

  def shooting?
    return false if shots.empty?
    shots.last.x < shots.last.initial_x + DistanceBeforeShootingAgain
  end
end

