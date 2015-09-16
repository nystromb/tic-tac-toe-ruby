require 'game_model'
require 'game_board'

describe Model do
  let(:board) { Board.new }
  let(:model) { Model.new }
  
  it '#move_is_valid returns true for input 1-9' do
    expect(model.move_is_valid(board.spots, 1)).to eq(true)
  end
  
  it '#move_is_valid returns true for input 1-9' do
    expect(model.move_is_valid(board.spots, 9)).to eq(true)
  end

  it '#move_is_valid returns true for input > 9' do
    expect(model.move_is_valid(board.spots, 10)).to eq(false)
  end
  
  it '#move_is_valid returns true for input < 1' do
    expect(model.move_is_valid(board.spots, 0)).to eq(false)
  end
  
  it '#move_is_valid returns false if the spot isn\'t empty' do
    test_board = board
    
    test_board.place(1, "X")
    
    expect(model.move_is_valid(test_board.spots, 1)).to eq(false)
  end
end