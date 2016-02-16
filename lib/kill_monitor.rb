class KillMonitor
  def initialize
  end

  def update(enemies, shots)
    enemies.each do |enemy|
      shots.each do |shot|
        if enemy.hit? shot 
          enemy.kill 
          shot.hit_something
        end
      end
    end
  end
end
