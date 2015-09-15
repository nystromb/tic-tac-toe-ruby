require "stringio"

class GameInput < StringIO
  def gets_mode
    $stdin.gets
  end
  
  def gets_move
    $stdin.gets
  end
end
