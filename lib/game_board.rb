require './lib/game_constants'

class Board < Hash
  include GameConstants
  attr_accessor :size
  
  def initialize(size)
    @win_rules = {
      3 => [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]], 
      4 => [[1,2,3,4], [5,6,7,8], [9,10,11,12], [13,14,15,16], [1,5,9,13], [2,6,10,14], [3,7,11,15], [4,8,12,16],[1,6,11,16],[4,7,10,13]]
      }
    @size = size
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
    @win_rules[@size].each do |index|
      if @size == 4
        return true if ((self.fetch(index[0]) == game_peice) && (self.fetch(index[1]) == game_peice) && (self.fetch(index[2]) == game_peice) && (self.fetch(index[3]) == game_peice))
      elsif @size == 3
        return true if ((self.fetch(index[0]) == game_peice) && (self.fetch(index[1]) == game_peice) && (self.fetch(index[2]) == game_peice))
      end
    end
    return false
  end
end
