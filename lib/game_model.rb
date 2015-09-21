class Model
  include GameConstants
  
  attr_accessor :player1, :player2, :current_player
  
  def initialize(board = Board.new)
    @board = board
    init_players(1)
  end
  
  def init_players(mode)
    case mode
    when HUMAN_VS_HUMAN
      @player1 = Player.new
      @player2 = Player.new
    when HUMAN_VS_COMPUTER
      @player1 = Player.new
      @player2 = RandomPlayer.new
    when COMPUTER_VS_COMPUTER
      @player1 = RandomPlayer.new
      @player2 = RandomPlayer.new
    end
    
    @player1.game_piece = X
    @player2.game_piece = O
    
    @current_player = @player1
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
    @board.place(move, @current_player.game_piece)
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
  
  def display_winner(output)
    if @board.match(WINNING_COMBOS, X)
      output.print "X wins"
    elsif @board.match(WINNING_COMBOS, O)
      output.print "O wins"
    else
      output.print "Draw game"
    end
  end
  
end
