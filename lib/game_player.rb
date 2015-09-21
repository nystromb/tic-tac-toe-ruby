class Player
  attr_accessor :game_piece
  
  def get_move(input)
    input.gets_move
  end
end