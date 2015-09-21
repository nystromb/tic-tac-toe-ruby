class GameRunner
  def initialize(output, input, model = Model.new)
    @output = output
    @input = input
    @model = model
  end
  
  def get_game_mode(input, output)
    output.puts "Please select a game mode\n 1. Human vs Human\n 2. Human vs Computer\n 3. Computer vs Computer\n"
    mode = input.gets_mode
    unless (mode.to_i >= 1) && (mode.to_i <= 3)
      output.puts "Invalid input. Try again"
      mode = input.gets_mode
    end
    mode.to_i
  end
  
  def run
    mode = get_game_mode(@input, @output)
    
    @model.init_players(mode)
    
    @output.print "Welcome to Tic Tac Toe\n"

    @model.display_board(@output)

    until @model.game_complete?
      move = @model.get_player_move(@input)
  
      break if move.nil?

      if @model.move_is_valid(move.to_i)
        @model.play(move.to_i)
        @model.switch_turns
      else
        @output.print "Invalid input. Try again\n"
        next
      end

      @model.display_board(@output)
    end

    @output.print "Game Over\n"

    #@model.display_winner(@output)
  end
end
