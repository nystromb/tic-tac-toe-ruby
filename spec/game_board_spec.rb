require 'game_board'

describe Board do
  let(:board) { Board.new }
  include GameConstants
  
  it 'can place moves on the board' do
    test_board = board
    
    test_board.place(1, "X")
    
    expect(board.spots.fetch(1)).to eq("X")  
  end
  
  it 'returns the indexes of the empty board spaces' do
    test_board = board
    
    test_board.place(1, "X")
    test_board.place(2, "X")
    test_board.place(3, "X")
    
    expect(test_board.empty_spots).to eq([4,5,6,7,8,9])
  end
  
  it 'matches a set of game winning indexes to a game peice' do
    expect(board.match(GameConstants::WINNING_COMBOS, GameConstants::X)).to eq(false)
  end
  
  it 'matches if X is at spots 1, 2, and 3' do
    test_board = board
    
    test_board.place(1, "X")
    test_board.place(2, "X")
    test_board.place(3, "X")
    
    expect(test_board.match(GameConstants::WINNING_COMBOS, GameConstants::X)).to eq(true)
  end
  
  it 'matches if X is at spots 3, 5, and 7' do
    test_board = board
    
    test_board.place(3, GameConstants::X)
    test_board.place(5, GameConstants::X)
    test_board.place(7, GameConstants::X)
    
    expect(test_board.match(GameConstants::WINNING_COMBOS, GameConstants::X)).to eq(true)
  end
  
  it 'matches if O is at spots 1, 2, and 3' do
    test_board = board 
    
    test_board.place(1, GameConstants::O)
    test_board.place(2, GameConstants::O)
    test_board.place(3, GameConstants::O)
    
    expect(test_board.match(GameConstants::WINNING_COMBOS, GameConstants::O)).to eq(true)
  end
  
  it 'matches if O is at spots 1, 4, and 7' do
    test_board = board 
    
    test_board.place(1, GameConstants::O)
    test_board.place(4, GameConstants::O)
    test_board.place(7, GameConstants::O)
    
    expect(test_board.match(GameConstants::WINNING_COMBOS, GameConstants::O)).to eq(true)
  end
  
  it 'can return the empty game board locations, if any' do
    test_board = board
    
    test_board.place(1, GameConstants::O)
    test_board.place(2, GameConstants::O)
    test_board.place(3, GameConstants::O)
    test_board.place(4, GameConstants::O)
    test_board.place(5, GameConstants::O)
    test_board.place(6, GameConstants::O)
    test_board.place(7, GameConstants::O)
    test_board.place(8, GameConstants::O)
    test_board.place(9, GameConstants::O)  
    
    expect(test_board.empty_spots.length).to eq(0)
  end
end