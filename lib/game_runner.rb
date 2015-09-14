class GameRunner

  def initialize(output, input)
    @output = output
    @input = input
    @board = {
      1 => "-",
      2 => "-",
      3 => "-",
      4 => "-",
      5 => "-",
      6 => "-",
      7 => "-",
      8 => "-",
      9 => "-"
      }
  end
  
  def display_board
    @board.each do |cell_num, contents|
      @output.print contents
      if cell_num % 3 == 0
        @output.puts 
      else
        @output.print "|"
      end
    end
  end
  
  def game_winner?
    win_check = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]
    win_check.each do |spot|
      if ((@board.fetch(spot[0]) == "X") && (@board.fetch(spot[1]) == "X") && (@board.fetch(spot[2]) == "X"))
        return true
        elsif ((@board.fetch(spot[0]) == "O") && (@board.fetch(spot[1]) == "O") && (@board.fetch(spot[2]) == "O"))
        return true
      end
    end
    return false
  end
  
  def run
    @output.puts "Welcome to Tic Tac Toe"

    display_board
    
    turn = 1
    until (move = @input.get_move).nil?
      if turn.odd?
        @board[move.to_i] = "X"
      else
        @board[move.to_i] = "O"
      end
      
      display_board
      
      if (turn += 1) == 9 || game_winner?
        @output.puts "Game Over"
        
        if game_winner? 
          @output.puts "#{@board.fetch(move.to_i)} wins" 
        else
          @output.puts "Draw game"
        end
      
        break
      end
    end
    
  end
  
end
