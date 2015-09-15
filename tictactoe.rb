require './lib/game_runner.rb'
require './lib/game_board.rb'
require './lib/game_model.rb'
require './lib/game_output.rb'
require './lib/game_input.rb'

if FILE = $0
  game = GameRunner.new(Board.new, Model.new, GameOutput.new, GameInput.new)
  game.run
end