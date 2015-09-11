require 'stringio'
require 'game_runner'

class MockInput
  attr_accessor :input
  def initialize
    @input = ""
  end
  
  def gets
    @input
  end
  
end


describe GameRunner do
  let(:output) { StringIO.new }
  let(:input) { MockInput.new }
  let(:runner) { described_class.new(output, input) }
  let(:welcome_message) {"Welcome to Tic Tac Toe\n"}
  
  it 'prints a welcome message' do    
    runner.run
    expect(output.string).to include(welcome_message)
  end
  
  it 'prints out the board' do
    runner.run
    expect(output.string).to include(welcome_message + "-|-|-\n")
  end
  
  it 'takes in input' do
    input.input = "1"
    
    runner.run
    
    expect(runner.moves.first).to eq("1")
  end
  
  it 'displays the guess 1' do
    input.input = "1"
    
    runner.run
    
    expect(output.string).to include("X|-|-\n")
  end
  
  it 'displays the guess 2' do
    input.input = "2"
    
    runner.run
    
    expect(output.string).to include("-|X|-\n")
  end
  
  it 'displays the guess 3' do 
    input.input = "3"
    
    runner.run
    
    expect(output.string).to include("-|-|X\n")
  end
  
  it 'displays the guess 4' do 
    input.input = "4"
    
    runner.run
    
    expect(output.string).to include("-|-|-\nX|-|-")
  end
  
  it 'displays the guess 5' do
    input.input = "5"
    
    runner.run
    
    expect(output.string).to include("-|-|-\n-|X|-")
  end
  
  it 'displays the guess 6' do
    input.input = "6"
    
    runner.run
    
    expect(output.string).to include("-|-|-\n-|-|X")
  end
  
  it 'displays the guess 7' do
    input.input = "7"
    
    runner.run
    
    expect(output.string).to include("-|-|-\n-|-|-\nX|-|-\n")
  end
  
  it 'displays the guess 8' do
    input.input = "8"
    
    runner.run
    
    expect(output.string).to include("-|-|-\n-|-|-\n-|X|-\n")
  end
  
  it 'displays the guess 9' do
    input.input = "9"
    
    runner.run
    
    expect(output.string).to include("-|-|-\n-|-|-\n-|-|X\n")
  end
end
  