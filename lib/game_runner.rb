require 'tic_tac_toe'
class GameRunner
  include TicTacToe
  def initialize(board, model, output, input)
    @board = board
    @model = model
    @output = output
    @input = input
    @turn = 1
  end
  
  def run
    @model.set_game_mode(@input, @output) if @model.mode.nil?
    
    @output.puts "Welcome to Tic Tac Toe"
    
    until @board.game_winner? || @turn > MAX_TURNS
      move = @input.gets_move
  
      @output.display(@board.spots)
  
      break if move.nil?

      if @model.move_is_valid(@board.spots, move.to_i)
        if @turn.odd?
          @board.place(move.to_i, X)
        else
          @board.place(move.to_i, O)
        end
      else
        @output.puts "Invalid move. Try again"
        next
      end
      @turn += 1
  
    end
    
    @output.puts "Game Over"

    if @board.game_winner? 
      @output.puts "#{@board.spots.fetch(move.to_i)} wins" 
    else
      @output.puts "Draw game"
    end

  end
end
