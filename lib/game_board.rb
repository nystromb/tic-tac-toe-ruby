require_relative 'game_pieces'

class Board < Hash
  include GamePieces
  attr_accessor :size
  
  def initialize
    @size = 1
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
end
