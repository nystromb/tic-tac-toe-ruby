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
    self.each { |index, peice| empty_spots << index if peice == EMPTY }
    empty_spots
  end
  
  def win(game_piece)
    win_indexes.each do |index|
      return true if (self.fetch(index[0]) == game_piece) && (self.fetch(index[1]) == game_piece) && (self.fetch(index[2]) == game_piece)
    end
    return false
  end

  def cell_count
    (size**2)
  end
  
  
  def win_indexes
    raise "Implement method"
  end
end
