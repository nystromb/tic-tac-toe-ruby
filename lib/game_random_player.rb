class RandomPlayer < Player
  def get_move(game)
    game.board.empty_spots.sample
  end
end