require './lib/game_model'

class GameRunner
  
  def initialize(output, input)
    @output = output
    @input = input
  end
  
  def run(mode = nil)
    mode = @input.gets_mode(@output) if mode.nil?
    
    @model = Model.new(mode)
    
    @output.print "Welcome to Tic Tac Toe\n"

    @output.display_board(@model.board)

    until @model.is_over?
      if @model.current_player.class == Player
        move = @input.gets_move
      else
        move = @model.current_player.get_move(@model.clone)
      end
  
      break if move.nil?

      if @model.move_is_valid(move.to_i)
        @model.play(move.to_i)
      else
        @output.print "Invalid input. Try again\n"
        next
      end
      @model.switch_turns
      @output.display_board(@model.board)
    end

    @output.print "Game Over\n"
    @output.display_winner(@model.board)
  end
end