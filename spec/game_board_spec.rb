require 'game_board'

describe Board do
  let(:board) { Board.new }
  let(:empty) { "-" }
  
  it 'can place moves on the board' do
    expect(board.spots.fetch(1)).to eq(empty)  
  end
  
  it 'returns false if there is nothing on the board' do
    expect(board.game_winner?).to eq(false)
  end
  
  it 'returns true if XXX is in a winning game position' do
    b = board
    
    b.place(1, "X")
    b.place(2, "X")
    b.place(3, "X")
    
    expect(board.game_winner?).to eq(true)
  end
  
  it 'returns true if OOO is in a winning game position' do
    b = board
    
    b.place(1, "O")
    b.place(5, "O")
    b.place(9, "O")
    
    expect(board.game_winner?).to eq(true)
  end
end