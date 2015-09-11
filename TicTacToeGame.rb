require './lib/GamePrompt.rb'
require './lib/GameModel.rb'
require './lib/Player.rb'

def validGameOptions(mode, first_player)
  if ((1..3).include?(mode)) && ((1..2).include?(first_player))
    return true
  else
    return false
  end
end

if ARGV.length == 2 
  mode = ARGV[0].to_i
  starting_player = ARGV[1].to_i
  
  if validGameOptions(mode, starting_player)    
    model = GameModel.new(mode, starting_player)
    board = GameBoard.new

    until board.game_complete?
      #running game loop
    
    end
  end
  
else
  GamePrompt.new.usage_message
end