require 'game_model'

describe Model do
  let(:model) { Model.new(1, 3)}

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
    test_model = model

    9.times do |spot|
      test_model.play(spot)
    end

    expect(test_model.is_over?).to eq(true)
  end

  it 'game is complete if X has a winning combination' do
    test_model = model

    test_model.play(1) #X
    test_model.play(2) #X
    test_model.play(3) #X

    expect(test_model.is_over?).to eq(true)
  end

  it 'game is complete if O has a winning combination' do
    test_model = model

    test_model.switch_turns

    test_model.play(4) #O
    test_model.play(5) #O
    test_model.play(6) #O

    expect(test_model.is_over?).to eq(true)
  end

  it 'player1 is of the Player class when mode is Human vs Human' do
    test_model = model

    expect(test_model.players[1].class).to eq(Player)
  end

  it 'player2 is of the Player class when mode is Human vs Human' do
    test_model = model

    expect(test_model.players[2].class).to eq(Player)
  end

  it 'player1 is a Player when game mode is Human vs Computer' do
    test_model = Model.new(2, 3)

    expect(test_model.players[1].class).to eq(Player)
  end

  it 'player2 is a RandomPlayer when game mode is Human vs Computer' do
    test_model = Model.new(2, 3)

    expect(test_model.players[2].class).to eq(UnbeatablePlayer)
  end

  it 'player1 is a RandomPlayer when the game mode is Computer vs Computer' do
    test_model = Model.new(3, 3)

    expect(test_model.players[1].class).to eq(UnbeatablePlayer)
  end

  it 'player2 is a RandomPlayer when the game mode is Computer vs Computer' do
    test_model = Model.new(3, 3)

    expect(test_model.players[2].class).to eq(UnbeatablePlayer)
  end

  it 'switches current_player from player1 turn to player2' do
    test_model = model

    expect(test_model.current_player).to eq(test_model.players[1])

    test_model.switch_turns

    expect(test_model.current_player).to eq(test_model.players[2])
  end

  it 'switches current_player from player2 turn to player1 turn' do
    test_model = model

    test_model.switch_turns

    expect(test_model.current_player).to eq(test_model.players[2])

    test_model.switch_turns

    expect(test_model.current_player).to eq(test_model.players[1])
  end

  it 'sets default player' do
    test_model = model

    test_model.set_current_player

    expect(test_model.current_player).to eq(test_model.players[1])
  end
end
