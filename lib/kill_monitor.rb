class KillMonitor
  def update(enemies, shots, player)
    enemies.each do |enemy|
      shots.each do |shot|
        if enemy.hit? shot 
          enemy.kill 
          shot.hit_something
        end
      end
      player.kill if enemy.hit? player
    end
  end
end
