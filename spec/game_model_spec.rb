require 'game_constants'
require 'game_model'
require 'game_board'

describe Model do
  let(:model) { Model.new }
  
  it '#move_is_valid returns true for input 1' do
    expect(model.move_is_valid(9)).to eq(true)
  end
  
  it '#move_is_valid returns true for input 9' do
    expect(model.move_is_valid(1)).to eq(true)
  end
  
  it '#move_is_valid returns true for input 5' do
    expect(model.move_is_valid(5)).to eq(true)
  end

  it '#move_is_valid returns false for input > 9' do
    expect(model.move_is_valid(10)).to eq(false)
  end
  
  it '#move_is_valid returns false for input < 1' do
    expect(model.move_is_valid(0)).to eq(false)
  end
  
  it '#move_is_valid returns false if the spot isn\'t empty' do
    model.play(1)
    
    expect(model.move_is_valid(1)).to eq(false)
  end
end