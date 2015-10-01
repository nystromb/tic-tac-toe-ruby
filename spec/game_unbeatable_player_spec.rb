
require 'game_unbeatable_player'
require 'game_model'

describe UnbeatablePlayer do
  let(:player) { UnbeatablePlayer.new }
  let(:board) { Board.new(3) }
  let(:model) { Model.new(3, 3) }

  it 'return a valid move' do
    test_model = model

    move = test_model.current_player.get_move(test_model)

    expect(test_model.move_is_valid(move)).to be_truthy
  end

  it 'scores 10 if x wins' do
    test_board = board

    test_board.place(1, "X")
    test_board.place(2, "X")
    test_board.place(3, "X")

    expect(player.score(test_board, 0)).to eq(10)
  end

  it 'scores -10 if o wins' do
    test_board = board

    test_board.place(1, "O")
    test_board.place(4, "O")
    test_board.place(7, "O")

    expect(player.score(test_board, 0)).to eq(-10)
  end

  it 'scores 0 if it is a draw game board' do
    test_board = board

    test_board.place(1, "X")
    test_board.place(2, "X")
    test_board.place(3, "O")
    test_board.place(4, "O")
    test_board.place(5, "O")
    test_board.place(6, "X")
    test_board.place(7, "X")
    test_board.place(8, "O")
    test_board.place(9, "X")

    expect(player.score(test_board, 0)).to eq(0)
  end

  it 'should return 3 as the best move' do
    test_model = model

    test_model.play(2)
    test_model.switch_turns
    test_model.play(7)
    test_model.switch_turns
    test_model.play(6)
    test_model.switch_turns
    test_model.play(8)
    test_model.switch_turns
    test_model.play(9)
    test_model.switch_turns

    expect(test_model.current_player.get_move(test_model)).to eq(3)
  end

    it 'scores games if the game model is end game' do
    test_model = model

    test_model.play(1)
    test_model.switch_turns

    expect(test_model.current_player.get_move(test_model)).to eq(5)
  end

end
