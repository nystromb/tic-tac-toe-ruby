require './lib/GamePrompt.rb'
require './lib/GameModel.rb'

output = GamePrompt.new

def validGameOptions(mode, first_player)
  if ((1..3).include?(mode)) && ((1..2).include?(first_player))
    return true
  else
    return false
  end
end

if ARGV.length == 2 
  mode = ARGV[0].to_i
  first_player = ARGV[1].to_i
  
  if validGameOptions(mode, first_player)
    model = GameModel.new(mode, first_player)
    model.start(output)
  end
  
else
  output.usage_message
end