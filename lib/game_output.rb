require 'stringio'

class GameOutput < StringIO
  def puts(string = "\n")
    $stdout.puts string
  end
  
  def print(string)
    $stdout.print string
  end
end