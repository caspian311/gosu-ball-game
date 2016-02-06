class KillMonitor
  def initialize
  end

  def update(enemies, shots)
    enemies.each do |enemy|
      shots.each do |shot|
        enemy.kill if enemy.hit? shot
      end
    end
  end
end
