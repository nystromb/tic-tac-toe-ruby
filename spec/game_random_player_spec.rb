require 'game_random_player'
require 'game_constants'
require 'game_board'

describe RandomPlayer do
  let(:player) { RandomPlayer.new }
  
  it 'gets move' do
    board = Board.new
    move = player.get_move(board)
    
    expect(1 <= move).to be_truthy
    expect(9 >= move).to be_truthy
  end
  
  it 'gets open move' do
    board = Board.new

    board.place(1, GameConstants::X)
    board.place(2, GameConstants::X)
    board.place(3, GameConstants::X)
    board.place(4, GameConstants::X)
    board.place(5, GameConstants::X)
    board.place(6, GameConstants::X)
    board.place(7, GameConstants::X)
    board.place(8, GameConstants::X)
    
    expect(player.get_move(board)).to eq(9)
  end
end