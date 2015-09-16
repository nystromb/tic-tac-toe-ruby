require 'tic_tac_toe'
class Model
  include TicTacToe
  attr_accessor :mode
  def initialize()
    @mode = nil
  end
  
  def move_is_valid(board, move)
    (board[move] == EMPTY) && (1..9).include?(move)
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
