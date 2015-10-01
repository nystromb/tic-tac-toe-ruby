require 'game_board'

describe Board do
  let(:board) { Board.new(3) }

  it 'board has a size' do
    expect(board.size).to eq(3)
  end

  it 'can have a board size of 4' do
    new_board = Board.new(4)

    expect(new_board.size).to eq(4)
  end

  it 'can tell you the number of cells' do
    new_board = Board.new(4)
    expect(new_board.cell_count).to eq(16)
  end

  it 'clears each spot to EMPTY' do
    expect(board.fetch(1)).to eq(GameConstants::EMPTY)
  end

  it 'clears each spot to EMPTY' do
    expect(board.fetch(9)).to eq(GameConstants::EMPTY)
  end

  it 'can place moves on the board' do
    test_board = board

    test_board.place(1, "X")

    expect(board.fetch(1)).to eq("X")
  end

  it 'returns the indexes of the empty board spaces' do
    test_board = board

    test_board.place(1, "X")
    test_board.place(2, "X")
    test_board.place(3, "X")

    expect(test_board.empty_spots).to eq([4,5,6,7,8,9])
  end

  it 'determines the win based on the board size' do
    test_board = Board.new(4)

    test_board.place(1, "X")
    test_board.place(2, "X")
    test_board.place(3, "X")
    test_board.place(4, "X")

    expect(test_board.win(GameConstants::X)).to be_truthy
  end

  it 'matches a set of game winning indexes to a game peice' do
    expect(board.win(GameConstants::X)).to eq(false)
  end

  it 'matches if X is at spots 1, 2, and 3' do
    test_board = board

    test_board.place(1, "X")
    test_board.place(2, "X")
    test_board.place(3, "X")

    expect(test_board.win(GameConstants::X)).to eq(true)
  end

  it 'matches if X is at spots 3, 5, and 7' do
    test_board = board

    test_board.place(3, GameConstants::X)
    test_board.place(5, X)
    test_board.place(7, GameConstants::X)

    expect(test_board.win(GameConstants::X)).to eq(true)
  end

  it 'matches if O is at spots 1, 2, and 3' do
    test_board = board

    test_board.place(1, GameConstants::O)
    test_board.place(2, GameConstants::O)
    test_board.place(3, GameConstants::O)

    expect(test_board.win(GameConstants::O)).to eq(true)
  end

  it 'matches if O is at spots 1, 4, and 7' do
    test_board = board

    test_board.place(1, GameConstants::O)
    test_board.place(4, GameConstants::O)
    test_board.place(7, GameConstants::O)

    expect(test_board.win(GameConstants::O)).to eq(true)
  end

  it 'can return the empty game board locations, if any' do
    test_board = board

    test_board.place(1, GameConstants::O)
    test_board.place(2, GameConstants::O)
    test_board.place(3, GameConstants::O)
    test_board.place(4, GameConstants::O)
    test_board.place(5, GameConstants::O)
    test_board.place(6, GameConstants::O)
    test_board.place(7, GameConstants::O)
    test_board.place(8, GameConstants::O)
    test_board.place(9, GameConstants::O)

    expect(test_board.empty_spots.length).to eq(0)
  end
end
