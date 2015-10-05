require './lib/game_board'

class FourByFourBoard < Board
  
  def initialize()
    super
  end
  
  def size
    4
  end
  
  def win_lineup(index, game_piece)
    (self.fetch(index[0]) == game_piece) && (self.fetch(index[1]) == game_piece) && (self.fetch(index[2]) == game_piece)  
  end
  
  def win_indexes
    [[1,2,3,4],[5,6,7,8],[9,10,11,12],[13,14,15,16],[1,5,9,13],[2,6,10,14],[3,7,11,15],[4,8,12,16],[1,6,11,16],[4,7,10,13]]
  end
  
end
