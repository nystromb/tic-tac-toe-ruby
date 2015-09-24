require './lib/game_constants'

class Board < Hash
  include GameConstants

  def initialize
    clear
  end
  
  def clear
    for spot in 1..MAX_SPOTS
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
  
  def match(winning_indexes, game_peice)
    winning_indexes.each do |index|
      return true if ((self.fetch(index[0]) == game_peice) && (self.fetch(index[1]) == game_peice) && (self.fetch(index[2]) == game_peice))
    end
    return false
  end
end