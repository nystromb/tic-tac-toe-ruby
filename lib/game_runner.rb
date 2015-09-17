class GameRunner
  def initialize(output, input)
    @output = output
    @input = input
  end

  def run
    model = Model.new()

    model.set_game_mode(@input, @output) if model.mode.nil?

    @output.print "Welcome to Tic Tac Toe\n"

    model.display_board(@output)

  until model.game_finished?
      move = @input.gets_move

      break if move.nil?

      if model.move_is_valid(move.to_i)
        model.play(move.to_i)
        model.turn += 1
      else
        @output.print "Invalid move. Try again\n"
        next
      end

      model.display_board(@output)
    end

    @output.print "Game Over\n"

    model.display_winner(@output)
  end
end
