class FourByFourBoard
  def size
    4
  end
  
  def win_lineup(board, index, piece)
    (board.fetch(index[0]) == piece) && (board.fetch(index[1]) == piece) && (board.fetch(index[2]) == piece) && (board.fetch(index[3]) == piece)  
  end
  
  def win_indexes
    [[1,2,3,4],[5,6,7,8],[9,10,11,12],[13,14,15,16],[1,5,9,13],[2,6,10,14],[3,7,11,15],[4,8,12,16],[1,6,11,16],[4,7,10,13]]
  end
  
end
