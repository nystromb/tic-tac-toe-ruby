require_relative 'game_pieces'

class Board < Hash
  include GamePieces
  attr_accessor :size
  
  WIN_INDEXES = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]
  def initialize
    @size = 3
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

  def cell_count
    (size**2)
  end

  def win(game_peice)
    WIN_INDEXES.each do |index|
      return true if (self.fetch(index[0]) == game_peice) && (self.fetch(index[1]) == game_peice) && (self.fetch(index[2]) == game_peice)
    end
    return false
  end
end
