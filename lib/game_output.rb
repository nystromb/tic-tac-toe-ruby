class GameOutput
  include GameConstants
  
  def puts(string = "\n")
    $stdout.puts string
  end
  
  def print(string)
    $stdout.print string
  end
  
  def display_board(board)
    board.spots.each do |spot, contents|
      print contents
      if spot % 3 == 0
        $stdout.puts
      else
        $stdout.print "|"
      end
    end
  end
  
  def display_winner(board)
    if board.match(WINNING_COMBOS, X)
      $stdout.print "X wins\n"
    elsif board.match(WINNING_COMBOS, O)
      $stdout.print "O wins\n"
    else
      $stdout.print "Draw game\n"
    end
  end
end