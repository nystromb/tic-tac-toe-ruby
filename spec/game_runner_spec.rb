require 'stringio'
require 'game_runner'
require 'game_player_factory'

class MockOutput < StringIO
  include GameConstants

  def display_board(board)
    board.each do |spot, contents|
      self.print contents
      if (spot % board.size) == 0
        self.puts
      else
        self.print "|"
      end
    end
  end

  def display_winner(board)
    if board.win(X)
      self.print "X wins\n"
    elsif board.win(O)
      self.print "O wins\n"
    else
      self.print "Draw game\n"
    end
  end
end

class MockInput
  attr_accessor :input
  def initialize
    @input = []
  end

  def gets
    @input.shift
  end
end

describe GameRunner do
  let(:output) { MockOutput.new }
  let(:input) { MockInput.new }
  let(:runner) { described_class.new(output, input) }
  let(:welcome_message) { "Welcome to Tic Tac Toe\n" }
  let(:x_wins_message) { "X wins" }
  let(:o_wins_message) { "O wins" }
  let(:draw_game_message) { "Draw game" }
  let(:end_game_message) { "Game Over" }
  let(:error_input_message) { "Invalid input. Try again" }


  it 'accepts a game mode input' do
    input.input = ["1"]

    runner

    expect(output.string).to include("Mode: Human vs. Human")
  end

  it 'prints out human vs computer mode' do
    input.input = ["2"]

    runner

    expect(output.string).to include("Mode: Human vs. Computer")
  end

  it 'prints out computer vs computer mode' do
    input.input = ["3"]

    runner

    expect(output.string).to include("Mode: Computer vs. Computer")
  end

  it 'prompts the user again if first input for mode of 4 or more' do
    input.input = ["4", "1"]

    runner

    expect(output.string).to include("Please select a game mode")
  end

  it 'prompts the user again if first input for mode of 0 or less' do
    input.input = ["0", "1"]

    runner

    expect(output.string).to include("Please select a game mode")
  end

  it 'prompts user to play a 4x4 board' do
    input.input = ["1"]

    runner

    expect(output.string).to include("Do you want to play on a 4x4 board? y/n")
  end

  it 'takes a game board size input y' do
    input.input = ["1", "y"]

    runner

    expect(output.string).to include("The board size is 4x4")
  end

  it 'prints a welcome message' do
    input.input = ["1"]

    runner.run

    expect(output.string).to include(welcome_message)
  end

  it 'prints out 4 columns if the board is 4x4' do
    input.input = ["1", "y"]

    runner.run

    expect(output.string).to include("-|-|-|-\n")
  end

  it 'prints out the board' do
    input.input = ["1"]

    runner.run

    expect(output.string).to include(welcome_message + "-|-|-\n")
  end

  it 'displays the guess 1' do
    input.input = ["1", "n", "1"]

    runner.run

    expect(output.string).to include("X|-|-\n")
  end

  it 'displays the guess 2' do
    input.input = ["1", "n", "2"]

    runner.run

    expect(output.string).to include("-|X|-\n")
  end

  it 'displays the guess 3' do
    input.input = ["1", "n", "3"]

    runner.run

    expect(output.string).to include("-|-|X\n")
  end

  it 'displays the guess 4' do
    input.input = ["1", "n", "4"]

    runner.run

    expect(output.string).to include("-|-|-\nX|-|-")
  end

  it 'displays the guess 5' do
    input.input = ["1", "n", "5"]

    runner.run

    expect(output.string).to include("-|-|-\n-|X|-")
  end

  it 'displays the guess 6' do
    input.input = ["1", "n", "6"]

    runner.run

    expect(output.string).to include("-|-|-\n-|-|X")
  end

  it 'displays the guess 7' do
    input.input = ["1", "n", "7"]

    runner.run

    expect(output.string).to include("-|-|-\n-|-|-\nX|-|-\n")
  end

  it 'displays the guess 8' do
    input.input = ["1", "n", "8"]

    runner.run

    expect(output.string).to include("-|-|-\n-|-|-\n-|X|-\n")
  end

  it 'displays the guess 9' do
    input.input = ["1", "n", "9"]

    runner.run

    expect(output.string).to include("-|-|-\n-|-|-\n-|-|X\n")
  end

  it 'displays the guess 1 and 2' do
    input.input = ["1", "n", "1", "2"]

    runner.run

    expect(output.string).to include("X|O|-\n")
  end

  it 'displays the guess 1 and 3' do
    input.input =["1", "n", "1", "3"]

    runner.run

    expect(output.string).to include("X|-|O\n")
  end

  it 'displays the guess 1 and 4' do
    input.input = ["1", "n", "1", "4"]

    runner.run

    expect(output.string).to include("X|-|-\nO|-|-\n")
  end

  it 'displays the guess 1 and 5' do
    input.input = ["1", "n", "1", "5"]

    runner.run

    expect(output.string).to include("X|-|-\n-|O|-\n")
  end

  it 'displays the guess 1 and 6' do
    input.input = ["1", "n", "1", "6"]

    runner.run

    expect(output.string).to include("X|-|-\n-|-|O\n")
  end

  it 'displays the guess 1 and 7' do
    input.input = ["1", "n", "1", "7"]

    runner.run

    expect(output.string).to include("X|-|-\n-|-|-\nO|-|-\n")
  end

  it 'displays \'Game Over\' when turn is 9' do
    input.input = ["1", "1", "2", "3", "4", "5", "6", "7", "8", "9"]

    runner.run

    expect(output.string).to include(end_game_message)
  end

  it 'displays \'X Wins\' when x wins' do
    input.input = ["1", "n", "1", "2", "5", "7", "9"]

    runner.run

    expect(output.string).to include(x_wins_message)
  end

  it 'displays \'O Wins\' when o wins' do
    input.input = ["1", "n", "1", "5", "3", "2", "4", "8"]

    runner.run

    expect(output.string).to include(o_wins_message)
  end

  it 'displays \'Draw Game\' when its a draw game' do
    input.input = ["1", "1", "5", "9", "6", "4", "7", "3", "2", "8"]

    runner.run

    expect(output.string).to include(draw_game_message)
  end

  it 'displays an error message on invalid string input' do
    input.input = ["1", "n", "1", "a string"]

    runner.run

    expect(output.string).to include(error_input_message)
  end

  it 'displays an error message if input is less than 1' do
    input.input = ["1", "n", "0"]

    runner.run

    expect(output.string).to include(error_input_message)
  end

  it 'displays an error message if input greater than 9' do
    input.input = ["1", "n", "10"]

    runner.run

    expect(output.string).to include(error_input_message)
  end

  it 'doesnt allow the game to make the same move twice' do
    input.input = ["1", "n", "1", "1"]

    runner.run

    expect(output.string).to include(error_input_message)
  end
end
