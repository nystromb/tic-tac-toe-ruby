class GameOutput
  include GamePieces
  
  def puts(string)
    $stdout.print string + "\n"
  end
  
  def print(string)
    $stdout.print string  
  end
  
  def display_board(board)
    board.each do |spot, contents|
      $stdout.print contents
      if (spot % board.size) == 0
        $stdout.puts
      else
        $stdout.print "|"
      end
    end
  end

  def display_winner(board)
    if board.win(X)
      $stdout.print "X wins\n"
    elsif board.win(O)
      $stdout.print "O wins\n"
    else
      $stdout.print "Draw game\n"
    end
  end
end
