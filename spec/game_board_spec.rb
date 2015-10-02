require_relative '../lib/game_board'

describe Board do
  let(:board) { Board.new }
  
  it 'has a board size of 1 by default' do
    expect(board.size).to eq(1)
  end
  
  it 'has a cell count of 1^2 == 1' do
    expect(board.cell_count).to eq(1)
  end
  
  it 'initializes the board spots to EMPTY' do
    expect(board.fetch(1)).to eq (GamePieces::EMPTY)  
  end
  
  it 'can return the empty spots on the board' do
    expect(board.empty_spots).to eq([1])
  end
  
  it 'can get the amount of empty spots' do
    expect(board.empty_spots.length).to eq(1)
  end
  
  it 'can tell you if the board is empty' do
    board.place(1, GamePieces::X)
    expect(board.empty_spots.length).to eq(0)
  end
end
