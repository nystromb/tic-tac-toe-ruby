require 'game_three_by_three_board'

describe ThreeByThreeBoard do
  let(:board) { ThreeByThreeBoard.new }
  
  it 'is a board' do
    expect(board.is_a? Board).to be_truthy
  end
  
  it 'has a board size of 3' do
    expect(board.size).to eq(3)
  end
  
  it 'has a cell count of 9' do
    expect(board.cell_count).to eq(9)
  end
  
  it 'win is false if no moves have been played' do
    expect(board.win(GamePieces::X)).to be_falsey
  end
  
  it 'win is true if three Pieces in a row at 1, 2, 3' do
    board.place(1, GamePieces::X)
    board.place(2, GamePieces::X)
    board.place(3, GamePieces::X)
    
    expect(board.win(GamePieces::X)).to be_truthy
  end
  
  it 'win is true if three Pieces in a row at 4, 5, 6' do
    board.place(4, GamePieces::X)
    board.place(5, GamePieces::X)
    board.place(6, GamePieces::X)
    
    expect(board.win(GamePieces::X)).to be_truthy
  end
  
  it 'win is true if three Pieces in a row at 7, 8, 9' do
    board.place(4, GamePieces::O)
    board.place(5, GamePieces::O)
    board.place(6, GamePieces::O)
    
    expect(board.win(GamePieces::O)).to be_truthy
  end
end