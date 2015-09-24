require './lib/game_player'
require './lib/game_random_player'
require './lib/game_unbeatable_player'

module PlayerFactory 
  include GameConstants
  
  def self.createPlayers(mode)
    case mode
    when HUMAN_VS_HUMAN
      players = { 1 => Player.new, 2 => Player.new }
    when HUMAN_VS_COMPUTER
      players = { 1 => Player.new, 2 => UnbeatablePlayer.new }
    when COMPUTER_VS_COMPUTER
      players = { 1 => UnbeatablePlayer.new, 2 => UnbeatablePlayer.new }
    end
    
    players[1].game_piece = X
    players[2].game_piece = O
    
    return players
  end
end