class RandomPlayer 
  def get_move(board)
    board.empty_spots.sample
  end
end