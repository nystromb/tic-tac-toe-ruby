class Model
  include GameConstants
  
  attr_accessor :turn, :player1, :player2, :current_player
  
  def initialize(board = Board.new)
    @board = board
    @turn = 1
    @player1 = Player.new
    @player2 = Player.new
    @current_player = @player1
  end
  
  def init_players(mode)
    case mode
    when HUMAN_VS_COMPUTER
      @player2 = RandomPlayer.new
    when COMPUTER_VS_COMPUTER
      @player1 = RandomPlayer.new
      @player2 = RandomPlayer.new
    end
  end

  def move_is_valid(move)
    (@board.spots[move] == EMPTY) && (1..9).include?(move)
  end
  
  def game_complete?  
    (@board.empty_spots.length == 0) || @board.match(WINNING_COMBOS, X) || @board.match(WINNING_COMBOS, O)
  end
  
  def get_player_move(input)
    if @current_player.class == Player
      @current_player.get_move(input)
    else
      @current_player.get_move(@board)
    end
  end
  
  def play(move)
    if @turn.odd?
      @board.place(move, X)
    else
      @board.place(move, O)
    end
  end
  
  def switch_turns
    if @current_player == @player1
      @current_player = @player2
    else
      @current_player = @player1
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
end
