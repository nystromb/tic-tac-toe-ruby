class GameRunner
  attr_reader :moves, :turns

  def initialize(output, input)
    @output = output
    @input = input
    @board = ["-","-","-","-","-","-","-","-","-"]
  end
  
  def display_board
    count = 1
    @board.each do |spot|
      @output.print spot
      if count % 3 == 0
        @output.puts
      else
        @output.print "|"
      end
      count += 1
    end
  end
  
  def run
    @output.puts "Welcome to Tic Tac Toe"
    
    display_board
    
    turn = 1
    while !(move = @input.gets).nil?
      if turn.odd?
        @board[move.to_i-1] = "X"
      else
        @board[move.to_i-1] = "O"
      end
      
      
      turn += 1
    end
    
    display_board

    

    

  end
  
end
