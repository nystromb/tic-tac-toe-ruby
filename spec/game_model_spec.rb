require 'game_board'
require 'three_by_three_strategy.rb'
require 'game_model'
require 'game_modes'
require 'game_player_factory'

describe Model do
  let(:board) { Board.new(ThreeByThreeBoard.new) }
  let(:players) { PlayerFactory.createPlayers(GameModes::HUMAN_VS_HUMAN) }
  let(:model) { Model.new(board, players)}

  it '#move_is_valid returns true for input 1' do
    expect(model.move_is_valid(1)).to eq(true)
  end

  it '#move_is_valid returns true for input 9' do
    expect(model.move_is_valid(9)).to eq(true)
  end

  it '#move_is_valid returns true for input 5' do
    expect(model.move_is_valid(5)).to eq(true)
  end

  it '#move_is_valid returns false for input > 9' do
    expect(model.move_is_valid(10)).to eq(false)
  end

  it '#move_is_valid returns false for input < 1' do
    expect(model.move_is_valid(0)).to eq(false)
  end

  it '#move_is_valid returns false if the spot isn\'t empty' do
    model.play(1)

    expect(model.move_is_valid(1)).to eq(false)
  end

  it 'game is complete if the board is full' do 
    9.times do |spot|
      model.play(spot)
    end

    expect(model.is_over?).to eq(true)
  end

  it 'game is complete if X has a winning combination' do
    model.play(1) #X
    model.play(2) #X
    model.play(3) #X

    expect(model.is_over?).to eq(true)
  end

  it 'game is complete if O has a winning combination' do
    model.switch_turns

    model.play(4) #O
    model.play(5) #O
    model.play(6) #O

    expect(model.is_over?).to eq(true)
  end

  it 'player1 is of the Player class when mode is Human vs Human' do
    expect(model.players[1].class).to eq(Player)
  end

  it 'player2 is of the Player class when mode is Human vs Human' do
    expect(model.players[2].class).to eq(Player)
  end

  it 'player1 is a Player when game mode is Human vs Computer' do
    players = PlayerFactory.createPlayers(GameModes::HUMAN_VS_COMPUTER)
    
    model = Model.new(board, players)

    expect(model.players[1].class).to eq(Player)
  end

  it 'player2 is a RandomPlayer when game mode is Human vs Computer' do 
    players = PlayerFactory.createPlayers(GameModes::HUMAN_VS_COMPUTER)

    model = Model.new(board, players)

    expect(model.players[2].class).to eq(UnbeatablePlayer)
  end

  it 'player1 is a RandomPlayer when the game mode is Computer vs Computer' do
    players = PlayerFactory.createPlayers(GameModes::COMPUTER_VS_COMPUTER)
      
    model = Model.new(board, players)

    expect(model.players[1].class).to eq(UnbeatablePlayer)
  end

  it 'player2 is a RandomPlayer when the game mode is Computer vs Computer' do
    players = PlayerFactory.createPlayers(GameModes::COMPUTER_VS_COMPUTER)

    model = Model.new(board, players)

    expect(model.players[2].class).to eq(UnbeatablePlayer)
  end

  it 'switches current_player from player1 turn to player2' do
    expect(model.current_player).to eq(model.players[1])
  end
  
  it 'switches player1 to player2' do
    model.switch_turns

    expect(model.current_player).to eq(model.players[2])
  end
end
