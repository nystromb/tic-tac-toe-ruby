require './lib/game_constants'
require './lib/game_player'

class UnbeatablePlayer < Player
  include GameConstants
  
  def get_move(game, depth = 0)
    return score(game.board, depth) if game.is_over?
    
    score = {}
    game.board.empty_spots.each do |move|
      game.play(move)
      game.switch_turns
      score[move] = get_move(game.clone, depth + 1)
      game.play(move, EMPTY)
      game.switch_turns
    end
    
    best_score = nil
    best_move = nil
    if game.current_player.game_piece == X
      best_score = -100
      score.each do |move, score|
        if score > best_score
          best_score = score
          best_move = move
        end
      end
    else
      best_score = 100
      score.each do |move, score|
        if score < best_score
          best_score = score
          best_move = move
        end
      end
    end
    
    return best_move if depth == 0
    best_score
  end
  
  def score(board, depth)
    if board.match(WINNING_COMBOS, X)
      return (10 - depth)
    elsif board.match(WINNING_COMBOS, O)
      return (depth - 10)
    else
      return 0
    end
  end
end