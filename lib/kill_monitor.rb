class KillMonitor
  attr_accessor :kill_count

  def initialize
    @kill_count = 0
  end

  def update(enemies, shots, player)
    enemies.each do |enemy|
      shots.each do |shot|
        if enemy.hit? shot 
          enemy.kill 
          shot.hit_something
          @kill_count += 1
        end
      end
      player.kill if enemy.hit? player and !player.dying?
    end
  end
end
