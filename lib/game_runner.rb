class GameRunner
  attr_reader :moves

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
  
  def run
    @output.puts "Welcome to Tic Tac Toe"

    display_board
    
    turn = 1
    while !(move = @input.gets).nil?
      if turn.odd?
        @board[move.to_i] = "X"
      else
        @board[move.to_i] = "O"
      end
      
      if (turn += 1) == 9
        @output.print "Game Over"
      end
    end
    
    display_board
  end
  
end
