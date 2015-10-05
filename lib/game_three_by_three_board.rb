require './lib/game_board'

class ThreeByThreeBoard < Board
  
  def initialize()
    super
  end

  def size
    3
  end
  
  def win_indexes
    [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]
  end
end
