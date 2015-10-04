require_relative '../lib/game_board'
require_relative '../lib/game_three_by_three_board'

describe Board do
  let(:board) { ThreeByThreeBoard.new }
  
  it 'has a board size of 3 by default' do
    expect(board.size).to eq(3)
  end
  
  it 'has a cell count of the size squared' do
    expect(board.cell_count).to eq(9)
  end
  
  it 'initializes the board spots to EMPTY' do
    expect(board.fetch(1)).to eq (GamePieces::EMPTY)  
  end
  
  it 'can return the empty spots on the board' do
    expect(board.empty_spots).to eq([1,2,3,4,5,6,7,8,9])
  end
  
  it 'can get the amount of empty spots' do
    expect(board.empty_spots.length).to eq(9)
  end
  
  it 'can tell you if the board is empty' do
    board.place(1, GamePieces::X)
    expect(board.empty_spots.length).to eq(8)
  end
end
