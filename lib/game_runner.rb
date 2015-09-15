class GameRunner
  X = "X"
  O = "O"  
  
  def initialize(board, model, output, input)
    @board = board
    @model = model
    @output = output
    @input = input
  end
  
  def run
    if @model.mode == nil
      @output.puts "Please select a game mode"
      mode = @input.gets_mode
      unless (mode.to_i >= 1) && (mode.to_i <= 3)
        @output.puts "Invalid input. Try again"
        mode = @input.gets_mode
      end
      @model.mode = mode.to_i
    end
    
    case @model.mode
    when 1
      @output.puts "Human vs Human"
    when 2
      @output.puts "Human vs Computer"
    when 3
      @output.puts "Computer vs Computer"
    end
    
    @output.puts "Welcome to Tic Tac Toe"

    @output.display(@board.spots)
    
    turn = 1
    while (move = @input.gets_move)
      break if move.nil?
      
      if @model.not_valid(move.to_i)
        @output.puts "Invalid input. Try again"
        next
      end
      
      if turn.odd?
        @board.place(move.to_i, X)
      else
        @board.place(move.to_i, O)
      end
      turn += 1
  
      @output.display(@board.spots)
      
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
