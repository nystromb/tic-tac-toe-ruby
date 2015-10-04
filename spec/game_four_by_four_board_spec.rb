require 'game_four_by_four_board'

describe FourByFourBoard do
  let(:board) { FourByFourBoard.new }
  
  it 'is a board' do
    expect(board.is_a? Board).to be_truthy
  end
  
  it 'size is 4' do 
    expect(board.size).to eq(4)
  end
  
  it 'has 16 cells' do
    expect(board.cell_count).to eq(16)  
  end
  
  it 'first spot is empty' do
    expect(board.fetch(1)).to eq(GamePieces::EMPTY)  
  end
  
  it 'returns false if its a brand new board for game piece X' do
    expect(board.win(GamePieces::X)).to be_falsey
  end
  
  it 'returns false if its a brand new board for game piece O' do
    expect(board.win(GamePieces::O)).to be_falsey
  end
  
  it 'board win is true if game pieces line up at 1, 2, 3, 4' do
    board.place(1, GamePieces::X)
    board.place(2, GamePieces::X)
    board.place(3, GamePieces::X)
    board.place(4, GamePieces::X)
    
    expect(board.win(GamePieces::X)).to be_truthy
  end
  
  it 'board win is true if game pieces line up at 5, 6, 7, 8' do
    board.place(5, GamePieces::X)
    board.place(6, GamePieces::X)
    board.place(7, GamePieces::X)
    board.place(8, GamePieces::X)
    
    expect(board.win(GamePieces::X)).to be_truthy
  end
  
  it 'board win is true if game pieces line up at 9, 10, 11, 12' do
    board.place(9, GamePieces::O)
    board.place(10, GamePieces::O)
    board.place(11, GamePieces::O)
    board.place(12, GamePieces::O)
    
    expect(board.win(GamePieces::O)).to be_truthy
  end
end