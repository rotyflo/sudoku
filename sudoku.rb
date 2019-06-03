require_relative "board"
require_relative "tile"

class Sudoku
  def initialize
    @board = Board.new(Board.from_file("puzzles/sudoku1.txt"))
  end

  def play
    while !@board.solved?
      @board.render
      val = get_val
      pos = get_pos
      
      if @board[pos].given
        puts "Cannot change given values"
        sleep(1)
      else
        @board[pos] = val
      end
    end

    puts "You win!"
  end

  def get_val
    val = nil

    while !valid?(val)
      print "Value: "
      val = gets.chomp

      val = nil if val.length != 1
    end

    val
  end

  def get_pos
    pos = nil

    while !valid?(pos)
      print "Position: "
      pos = gets.chomp

      pos = nil if pos.length != 2
    end

    pos.split("").map { |char| char.to_i - 1 }
  end

  def valid?(input)
    return false if input == nil

    input.split("").all? { |char| "123456789".include?(char) }
  end
end

game = Sudoku.new

game.play