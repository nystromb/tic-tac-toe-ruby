require_relative 'game_pieces'

class Board < Hash
  include GamePieces
  
  def initialize
    clear
  end

  def clear
    for spot in 1..self.cell_count
      self[spot] = EMPTY
    end
  end

  def place(move, peice)
    self[move] = peice
  end

  def empty_spots
    empty_spots = []
    self.each { |index, piece| empty_spots << index if piece == EMPTY }
    empty_spots
  end
  
  def win(game_piece)
    win_indexes.each do |index|
      return true if win_lineup(index, game_piece)
    end
    return false
  end

  def win_lineup(index, game_piece)
    raise "Implement method"
  end

  def cell_count
    (size**2)
  end
   
  def win_indexes
    raise "Implement method"
  end
end
