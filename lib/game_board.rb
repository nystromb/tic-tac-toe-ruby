require './lib/game_constants'

class Board
  include GameConstants
  
  attr_reader :spots
  def initialize
    @spots = { 1 => EMPTY, 2 => EMPTY, 3 => EMPTY, 4 => EMPTY, 5 => EMPTY, 6 => EMPTY, 7 => EMPTY, 8 => EMPTY, 9 => EMPTY }
  end

  def place(move, peice)
    @spots[move] = peice
  end
  
  def empty_spots
    empty_spots = []
    @spots.each { |index, peice| empty_spots << index if peice == EMPTY }
    empty_spots
  end
  
  def match(winning_indexes, game_peice)
    winning_indexes.each do |index|
      return true if ((@spots.fetch(index[0]) == game_peice) && (@spots.fetch(index[1]) == game_peice) && (@spots.fetch(index[2]) == game_peice))
    end
    return false
  end
end