require 'stringio'
require 'game_runner'

class MockInput
  attr_accessor :moves
  def initialize
    @moves = []
  end
  
  def get_move
    @moves.shift
  end
  
end


describe GameRunner do
  let(:output) { StringIO.new }
  let(:input) { MockInput.new }
  let(:runner) { described_class.new(output, input) }
  let(:welcome_message) { "Welcome to Tic Tac Toe\n" }
  let(:x_wins_message) { "X wins" }
  let(:o_wins_message) { "O wins" }
  let(:draw_game_message) { "Draw game" }
  let(:end_game_message) { "Game Over" }
  
  it 'prints a welcome message' do    
    runner.run
    
    expect(output.string).to include(welcome_message)
  end
  
  it 'prints out the board' do
    runner.run
    
    expect(output.string).to include(welcome_message + "-|-|-\n")
  end
  
  it 'displays the guess 1' do
    input.moves = ["1"]
    
    runner.run
    
    expect(output.string).to include("X|-|-\n")
  end
  
  it 'displays the guess 2' do
    input.moves = ["2"]
    
    runner.run
    
    expect(output.string).to include("-|X|-\n")
  end
  
  it 'displays the guess 3' do 
    input.moves = ["3"]
    
    runner.run
    
    expect(output.string).to include("-|-|X\n")
  end
  
  it 'displays the guess 4' do 
    input.moves = ["4"]
    
    runner.run
    
    expect(output.string).to include("-|-|-\nX|-|-")
  end
  
  it 'displays the guess 5' do
    input.moves = ["5"]
    
    runner.run
    
    expect(output.string).to include("-|-|-\n-|X|-")
  end
  
  it 'displays the guess 6' do
    input.moves = ["6"]
    
    runner.run
    
    expect(output.string).to include("-|-|-\n-|-|X")
  end
  
  it 'displays the guess 7' do
    input.moves = ["7"]
    
    runner.run
    
    expect(output.string).to include("-|-|-\n-|-|-\nX|-|-\n")
  end
  
  it 'displays the guess 8' do
    input.moves = ["8"]
    
    runner.run
    
    expect(output.string).to include("-|-|-\n-|-|-\n-|X|-\n")
  end
  
  it 'displays the guess 9' do
    input.moves = ["9"]
    
    runner.run
    
    expect(output.string).to include("-|-|-\n-|-|-\n-|-|X\n")
  end
  
  it 'displays the guess 1 and 2' do
    input.moves = ["1", "2"]
  
    runner.run
    
    expect(output.string).to include("X|O|-\n")
  end
  
  it 'displays the guess 1 and 3' do
    input.moves =[ "1", "3"]
    
    runner.run
    
    expect(output.string).to include("X|-|O\n")
  end
  
  it 'displays the guess 1 and 4' do
    input.moves = ["1", "4"]
    
    runner.run
    
    expect(output.string).to include("X|-|-\nO|-|-\n")
  end
  
  it 'displays the guess 1 and 5' do
    input.moves = ["1", "5"]
    
    runner.run
    
    expect(output.string).to include("X|-|-\n-|O|-\n")
  end
  
  it 'displays the guess 1 and 6' do
    input.moves = ["1", "6"]
    
    runner.run
    
    expect(output.string).to include("X|-|-\n-|-|O\n")
  end
  
  it 'displays the guess 1 and 7' do
    input.moves = ["1", "7"]
    
    runner.run
    
    expect(output.string).to include("X|-|-\n-|-|-\nO|-|-\n")
  end
  
  it 'displays when turn is 9' do
    input.moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    
    runner.run
    
    expect(output.string).to include(end_game_message)
  end
  
  it 'displays board when x is at 1, 2, 3' do
    input.moves = ["1", "5", "2", "6", "3"]
    
    runner.run
    
    expect(output.string).to include("X|X|X\n-|O|O\n-|-|-\n")
  end
  
  it 'tells you when x wins' do
    input.moves = ["1", "2", "5", "7", "9"]
    
    runner.run
    
    expect(output.string).to include(x_wins_message)
  end
  
  it 'tells you when o wins' do
    input.moves = ["1", "5", "3", "2", "4", "8"]
    
    runner.run
    
    expect(output.string).to include(o_wins_message)
  end
  
  it 'tells you when its a draw game' do
    input.moves = ["1", "5", "9", "6", "4", "7", "3", "2", "8"]
    
    runner.run
    
    expect(output.string).to include(draw_game_message)
  end
  
end
  