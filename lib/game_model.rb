require './lib/game_constants'
require './lib/game_board'
require './lib/game_player_factory'

class Model
  include GameConstants
  include PlayerFactory

  attr_reader :board, :current_player, :players
  
  def initialize(mode)
    @board = Board.new
    @players = PlayerFactory.createPlayers(mode)
    set_current_player
  end

  def set_current_player(number = 1)
    @current_player = @players[number]
  end
  
  def move_is_valid(move)
    (@board[move] == EMPTY) && (move >= 1 && move <= 9)
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
  
  def reset
    @board.clear
  end
end