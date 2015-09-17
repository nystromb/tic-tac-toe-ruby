require 'game_constants'
require 'game_board'

describe Board do
  let(:board) { Board.new }
  
  it 'can place moves on the board' do
    test_board = board
    
    test_board.place(1, "X")
    
    expect(board.spots.fetch(1)).to eq("X")  
  end
  
  it 'returns false if there is nothing on the board' do
    expect(board.game_winner?).to eq(false)
  end
  
  it 'returns true if XXX is in a winning game position' do
    test_board = board
    
    test_board.place(1, "X")
    test_board.place(2, "X")
    test_board.place(3, "X")
    
    expect(test_board.game_winner?).to eq(true)
  end
  
  it 'returns true if OOO is in a winning game position' do
    test_board = board
    
    test_board.place(1, "O")
    test_board.place(5, "O")
    test_board.place(9, "O")
    
    expect(test_board.game_winner?).to eq(true)
  end
end