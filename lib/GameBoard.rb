class GameBoard
  attr_reader :cells
  EMPTY = :EMPTY
  
  def initialize 
    @cells = Hash.new do |cell, location|
      if (location > 1 || location < 9)
        cell[location] = EMPTY
      end
    end
  end
  
  def place(game_peice, location)
    @cells[location] = game_peice
  end
  
  def moveIsValid(location)
    result = false
    if (location > 1 || location < 9) && (@cell[location] == EMPTY)
      result = true
    end
    
    result
  end
  
  
end