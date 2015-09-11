class GameRunner
  attr_reader :moves

  def initialize(output, input)
    @output = output
    @input = input
    @moves = []
  end
  
  def run
    @output.puts "Welcome to Tic Tac Toe"
    
    @output.puts "-|-|-"
    @output.puts "-|-|-"
    @output.puts "-|-|-"
    
    @moves << @input.gets
    
    if @moves.first == "1"
      @output.puts "X|-|-"
      @output.puts "-|-|-"
      @output.puts "-|-|-"
    elsif @moves.first == "2"
      @output.puts "-|X|-"
      @output.puts "-|-|-"
      @output.puts "-|-|-"
    elsif @moves.first == "3"
      @output.puts "-|-|X"
      @output.puts "-|-|-"
      @output.puts "-|-|-"
    elsif @moves.first == "4"
      @output.puts "-|-|-"
      @output.puts "X|-|-"
      @output.puts "-|-|-"
    elsif @moves.first == "5"
      @output.puts "-|-|-"
      @output.puts "-|X|-"
      @output.puts "-|-|-"
    elsif @moves.first == "6"
      @output.puts "-|-|-"
      @output.puts "-|-|X"
      @output.puts "-|-|-"
    elsif @moves.first == "7"
      @output.puts "-|-|-"
      @output.puts "-|-|-"
      @output.puts "X|-|-"
    elsif @moves.first == "8"
      @output.puts "-|-|-"
      @output.puts "-|-|-"
      @output.puts "-|X|-"
    elsif @moves.first == "9"
      @output.puts "-|-|-"
      @output.puts "-|-|-"
      @output.puts "-|-|X"
    end
  end
  
end
