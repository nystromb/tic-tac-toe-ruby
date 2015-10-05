require 'game_random_player'
require 'game_model'

describe RandomPlayer do
  let(:board) { Board.new(ThreeByThreeBoard.new) }
  let(:player) { described_class.new }

  it 'gets move' do
    game = Model.new(board, GameModes::COMPUTER_VS_COMPUTER)
    
    move = player.get_move(game)

    expect(1 <= move).to be_truthy
    expect(9 >= move).to be_truthy
  end

  it 'gets open move' do
    model = Model.new(board, GameModes::COMPUTER_VS_COMPUTER)

    model.play(1, GamePieces::X)
    model.play(2, GamePieces::X)
    model.play(3, GamePieces::X)
    model.play(4, GamePieces::X)
    model.play(5, GamePieces::X)
    model.play(6, GamePieces::X)
    model.play(7, GamePieces::X)
    model.play(8, GamePieces::X)

    expect(player.get_move(model)).to eq(9)
  end
end
