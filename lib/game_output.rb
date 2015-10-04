require 'stringio'

class GameOutput < StringIO
  include GamePieces

  def display_board(board)
    board.each do |spot, contents|
      self.print contents
      if (spot % board.size) == 0
        self.puts
      else
        self.print "|"
      end
    end
  end

  def display_winner(board)
    if board.win(X)
      self.print "X wins\n"
    elsif board.win(O)
      self.print "O wins\n"
    else
      self.print "Draw game\n"
    end
  end
end
