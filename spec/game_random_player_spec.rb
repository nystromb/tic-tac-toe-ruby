require 'game_random_player'
require 'game_model'

describe RandomPlayer do
  let(:player) { RandomPlayer.new }
  
  it 'gets move' do
    game = Model.new 1
    move = player.get_move(game)
    
    expect(1 <= move).to be_truthy
    expect(9 >= move).to be_truthy
  end
  
  it 'gets open move' do
    model = Model.new 1

    model.play(1, GameConstants::X)
    model.play(2, GameConstants::X)
    model.play(3, GameConstants::X)
    model.play(4, GameConstants::X)
    model.play(5, GameConstants::X)
    model.play(6, GameConstants::X)
    model.play(7, GameConstants::X)
    model.play(8, GameConstants::X)
    
    expect(player.get_move(model)).to eq(9)
  end
end