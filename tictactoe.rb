require './lib/game_constants'
require './lib/game_player'
require './lib/game_random_player'
require './lib/game_runner'
require './lib/game_model'
require './lib/game_board'
require './lib/game_output'
require './lib/game_input'

GameRunner.new(GameOutput.new, GameInput.new).run