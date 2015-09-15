class GameRunner
  X = "X"
  O = "O"  
  
  def initialize(output = STDOUT, input = STDIN, board)
    @output = output
    @input = input
    @board = board
  end
  
  def display_board
    @board.spots.each do |spot, contents|
      @output.print contents
      ([3,6,9].include?(spot)) ? (@output.puts) : (@output.print "|")
    end
  end
  
  def run
    @output.puts "Welcome to Tic Tac Toe"

    display_board
    
    turn = 1
    while (move = @input.gets)
      
      if move.to_i < 1 || move.to_i > 9
        @output.puts "Invalid input. Try again"
        next
      elsif move.nil?
        break
      end
      
      if turn.odd?
        @board.place(move.to_i, X)
      else
        @board.place(move.to_i, O)
      end
      turn += 1
  
      display_board
      
      if @board.game_winner? || turn > 9
        @output.puts "Game Over"
        if @board.game_winner? 
          @output.puts "#{@board.spots.fetch(move.to_i)} wins" 
        else
          @output.puts "Draw game"
        end
        break
      end
    end
  end
end
