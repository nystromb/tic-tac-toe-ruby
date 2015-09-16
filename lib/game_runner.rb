class GameRunner
  HUMAN_VS_HUMAN = 1
  HUMAN_VS_COMPUTER = 2
  COMPUTER_VS_COMPUTER = 3
  MAX_TURNS = 9
  X = "X"
  O = "O"
  
  def initialize(board, model, output, input)
    @board = board
    @model = model
    @output = output
    @input = input
    @turn = 1
  end
  
  def run
    if @model.mode.nil?
      @output.puts "Please select a game mode\n 1. Human vs Human\n 2. Human vs Computer\n 3. Computer vs Computer\n"
      @model.mode = get_game_mode
    end
    
    case @model.mode
    when HUMAN_VS_HUMAN
      @output.puts "Human vs Human"
    when HUMAN_VS_COMPUTER
      @output.puts "Human vs Computer"
    when COMPUTER_VS_COMPUTER
      @output.puts "Computer vs Computer"
    end
    
    @output.puts "Welcome to Tic Tac Toe"

    @output.display(@board.spots)
    
    until @board.game_winner? || @turn > MAX_TURNS
      move = @input.gets_move
  
      break if move.nil?
      
      if @model.not_valid(move.to_i) || (@board.spots[move.to_i] != "-")
        @output.puts "Invalid input. Try again"
        next
      end
      
      if @turn.odd?
        @board.place(move.to_i, X)
      else
        @board.place(move.to_i, O)
      end

      @turn += 1
  
      @output.display(@board.spots)
    end
    
    @output.puts "Game Over"

    if @board.game_winner? 
      @output.puts "#{@board.spots.fetch(move.to_i)} wins" 
    else
      @output.puts "Draw game"
    end
  end

  def get_game_mode
    mode = nil
    unless (mode.to_i >= 1) && (mode.to_i <= 3)
      @output.puts "Invalid input. Try again"
      mode = @input.gets_mode
    end
    mode.to_i
  end
end
