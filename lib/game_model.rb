require './lib/game_constants'
require './lib/game_board'
require './lib/game_player_factory'

class Model
  include GameConstants
  include PlayerFactory
  
  attr_accessor :players, :current_player
  attr_reader :board
  
  def initialize(mode, board = Board.new)
    @players = PlayerFactory.createPlayers(mode)
    @board = board
    @current_player = @players[1]
  end

  def move_is_valid(move)
    (@board.spots[move] == EMPTY) && (move >= 1 && move <= 9)
  end
  
  def is_over?  
    (@board.empty_spots.length == 0) || @board.match(WINNING_COMBOS, X) || @board.match(WINNING_COMBOS, O)
  end
  
  def play(move, peice = @current_player.game_piece)
    @board.place(move, peice)
  end
  
  def switch_turns
    if @current_player == @players[1]
      @current_player = @players[2]
    else
      @current_player = @players[1]
    end
  end
  
  def display_board(output)
    @board.spots.each do |spot, contents|
      output.print contents
      if spot % 3 == 0
        output.puts
      else
        output.print "|"
      end
    end
  end
  
  def display_winner(output)
    if @board.match(WINNING_COMBOS, X)
      output.print "X wins\n"
    elsif @board.match(WINNING_COMBOS, O)
      output.print "O wins\n"
    else
      output.print "Draw game\n"
    end
  end
end