require './lib/game_model'
require './lib/three_by_three_strategy.rb'
require './lib/four_by_four_strategy.rb'

class GameRunner
  include PlayerFactory

  def initialize(output, input, *args)
    @output = output
    @input = input
    
    mode = get_game_mode
    
    @output.puts "Mode: Human vs. Human" if mode == 1
    @output.puts "Mode: Human vs. Computer" if mode == 2
    @output.puts "Mode: Computer vs. Computer" if mode == 3
    
    @players = PlayerFactory.createPlayers(mode)

    @output.print "Do you want to play on a 4x4 board? y/n\n"
    @board_size = @input.gets
    if (@board_size == "y" || @board_size == "y\n")
      @board = Board.new(FourByFourBoard.new)
    else
      @board = Board.new(ThreeByThreeBoard.new)
    end

    @output.print "The board size is #{@board.size}x#{@board.size}\n"

    @game = Model.new(@board, @players)
  end

  def get_game_mode
    mode = nil
    while ((mode.to_i >= 4) || (mode.to_i <= 0))
      @output.puts "Please select a game mode\n 1. Human vs Human\n 2. Human vs Computer\n 3. Computer vs Computer\n"
      mode = @input.gets.to_i
    end
    mode 
  end

  def run
    @output.print "Welcome to Tic Tac Toe\n"

    @output.display_board(@game.board)

    until @game.is_over?
      if @game.current_player.class == Player
        move = @input.gets
      else
        move = @game.current_player.get_move(@game.clone)
      end

      break if move.nil?

      if @game.move_is_valid(move.to_i)
        @game.play(move.to_i)
      else
        @output.print "Invalid input. Try again\n"
        next
      end

      @game.switch_turns
      @output.display_board(@game.board)
    end

    @output.print "Game Over\n"
    @output.display_winner(@game.board)
  end
end
