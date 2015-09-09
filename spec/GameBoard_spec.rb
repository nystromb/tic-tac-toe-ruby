require 'GameBoard'

RSpec.describe GameBoard do
  it 'cells should be empty when first initialized' do
    board = GameBoard.new
  
    9.times do |location|
      expect(board.cells[location+1]).to eq(:EMPTY)
    end
  end
  
  it 'can place a game peice on a valid cell location' do
    board = GameBoard.new
    board.place("X", 1)
    expect(board.cells[1]).to eq("X")
  end

  it 'can check if a move is valid' do
    board = GameBoard.new
    expect(board.moveIsValid(1)).to eq(true)
  end
  
  it '' do 
    
  end
  
end
