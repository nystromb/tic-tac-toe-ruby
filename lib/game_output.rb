require 'stringio'

class GameOutput < StringIO
  def display(spots)
    spots.each do |spot, contents|
      $stdout.print contents
      ([3,6,9].include?(spot)) ? ($stdout.puts) : ($stdout.print "|")
    end
  end
  
  def puts(string)
    $stdout.puts string
  end
  
  def print(string)
    $stdout.print string
  end
end