require_relative 'game_pieces'

class Board < Hash
  include GamePieces
  attr_accessor :strategy

  def initialize(strategy)
    @strategy = strategy
    clear
  end
  
  def size 
    @strategy.size
  end
  
  def cell_count
    (@strategy.size**2)
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
    @strategy.win_indexes.each do |index|
      return true if @strategy.win_lineup(self, index, game_piece)
    end
    return false
  end
end
