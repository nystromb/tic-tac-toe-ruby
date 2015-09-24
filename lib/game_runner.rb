require './lib/game_model'

class GameRunner
  
  def initialize(output, input)
    @output = output
    @input = input
  end
  
  def run(mode = nil)
    mode = @input.gets_mode(@output) if mode.nil?
    
    game = Model.new(mode)
    
    @output.print "Welcome to Tic Tac Toe\n"

    @output.display_board(game.board)

    until game.is_over?
      if game.current_player.class == Player
        move = @input.gets_move
      else
        move = game.current_player.get_move(game.clone)
      end
  
      break if move.nil?

      if game.move_is_valid(move.to_i)
        game.play(move.to_i)
      else
        @output.print "Invalid input. Try again\n"
        next
      end
  
      game.switch_turns
      @output.display_board(game.board)
    end

    @output.print "Game Over\n"
    @output.display_winner(game.board)
  end
end