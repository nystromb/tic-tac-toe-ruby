class GameInput
  def gets_mode(output)
    output.puts "Please select a game mode\n 1. Human vs Human\n 2. Human vs Computer\n 3. Computer vs Computer\n"
    mode = $stdin.gets
    unless (mode.to_i >= 1) && (mode.to_i <= 3)
      output.puts "Invalid input. Try again"
      mode = $stdin.gets_mode
    end
    mode.to_i
  end
  
  def gets_move
    $stdin.gets
  end
end