require './lib/game_model'

class GameRunner
  
  def initialize(output, input)
    @output = output
    @input = input
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
  
  def run(mode = nil)
    mode = get_game_mode(@input, @output) if mode.nil?
    
    @model = Model.new(mode)
    
    @output.print "Welcome to Tic Tac Toe\n"

    @model.display_board(@output)

    until @model.is_over?
      if @model.current_player.class == Player
        move = @input.gets_move
      else
        move = @model.current_player.get_move(@model.clone)
      end
  
      break if move.nil?

      if @model.move_is_valid(move.to_i)
        @output.puts "Played move #{move}"
        @model.play(move.to_i)
      else
        @output.print "Invalid input. Try again\n"
        next
      end
      @model.switch_turns
      @model.display_board(@output)
    end

    @output.print "Game Over\n"
    @model.display_board(@output)
    @model.display_winner(@output)
  end
end