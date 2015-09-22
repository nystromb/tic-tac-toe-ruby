require "./lib/game_runner"
require "./lib/game_output"
require "./lib/game_input"

GameRunner.new(GameOutput.new, GameInput.new).run