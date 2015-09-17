class Model
  include GameConstants
  
  attr_accessor :mode, :turn
  def initialize(board = Board.new)
    @board = board
    @mode = nil
    @turn = 1
  end

  def move_is_valid(move)
    (@board.spots[move] == EMPTY) && (1..9).include?(move)
  end

  def game_finished?
    @board.game_winner? || @turn > MAX_TURNS
  end
  
  def display_board(output)
    @board.spots.each do |spot, contents|
      output.print contents
      ([3,6,9].include?(spot)) ? (output.puts) : (output.print "|")
    end
  end
  
  def play(move)
    if @turn.odd?
      @board.place(move, X)
    else
      @board.place(move, O)
    end
  end

  def display_winner(output)
    if @board.game_winner?

    else
      output.print "Draw game"
    end
  end

  def set_game_mode(input, output)
    output.puts "Please select a game mode\n 1. Human vs Human\n 2. Human vs Computer\n 3. Computer vs Computer\n"
    mode = input.gets_mode
    unless (mode.to_i >= 1) && (mode.to_i <= 3)
      output.puts "Invalid input. Try again"
      mode = input.gets_mode
    end
    self.mode = mode.to_i
  end
end
