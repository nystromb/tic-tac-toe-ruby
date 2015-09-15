class Board
  attr_reader :spots
  EMPTY = "-"
  
  def initialize
    @spots = { 1 => EMPTY, 2 => EMPTY, 3 => EMPTY, 4 => EMPTY, 5 => EMPTY, 6 => EMPTY, 7 => EMPTY, 8 => EMPTY, 9 => EMPTY }
  end
  
  def place(move, peice)
    @spots[move] = peice
  end
  
  def game_winner?
    winning_combos = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]
    winning_combos.each do |combo|
      return true if ((@spots.fetch(combo[0]) == "X") && (@spots.fetch(combo[1]) == "X") && (@spots.fetch(combo[2]) == "X")) || ((@spots.fetch(combo[0]) == "O") && (@spots.fetch(combo[1]) == "O") && (@spots.fetch(combo[2]) == "O"))
    end
    return false
  end
end