
require 'game_unbeatable_player'
require 'game_model'

describe UnbeatablePlayer do
  let(:player) { UnbeatablePlayer.new }
  let(:board) { Board.new }
  let(:model) { Model.new(board, GameModes::COMPUTER_VS_COMPUTER) }

  it 'return a valid move' do
    move = model.current_player.get_move(model)

    expect(model.move_is_valid(move)).to be_truthy
  end

  it 'scores 10 if x wins' do
    board.place(1, "X")
    board.place(2, "X")
    board.place(3, "X")

    expect(player.score(board, 0)).to eq(10)
  end

  it 'scores -10 if o wins' do
    board.place(1, "O")
    board.place(4, "O")
    board.place(7, "O")

    expect(player.score(board, 0)).to eq(-10)
  end

  it 'scores 0 if it is a draw game board' do
    board.place(1, "X")
    board.place(2, "X")
    board.place(3, "O")
    board.place(4, "O")
    board.place(5, "O")
    board.place(6, "X")
    board.place(7, "X")
    board.place(8, "O")
    board.place(9, "X")

    expect(player.score(board, 0)).to eq(0)
  end

  it 'should return 3 as the best move' do
    model.play(2)
    model.switch_turns
    model.play(7)
    model.switch_turns
    model.play(6)
    model.switch_turns
    model.play(8)
    model.switch_turns
    model.play(9)
    model.switch_turns

    expect(model.current_player.get_move(model)).to eq(3)
  end

  it 'scores games if the game model is end game' do
    model.play(1)
    model.switch_turns

    expect(model.current_player.get_move(model)).to eq(5)
  end
end
