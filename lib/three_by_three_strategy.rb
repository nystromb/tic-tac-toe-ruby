class ThreeByThreeBoard 
  def size
    3
  end
  
  def win(board, piece)
    win_indexes.each do |index|
      return true if win_lineup(board, index, piece)
    end
    return false
  end
 
  def win_lineup(board, index, piece)
    (board.fetch(index[0]) == piece) && (board.fetch(index[1]) == piece) && (board.fetch(index[2]) == piece)  
  end
  
  def win_indexes
    [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]
  end
end
