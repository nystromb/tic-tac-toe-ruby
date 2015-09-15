class Model
  attr_accessor :mode
  def initialize
    @mode = nil
  end
  
  def not_valid(move)
    move < 1 || move > 9
  end
end
