require_relative "board"
require_relative "tile"

class Sudoku
  def initialize
    @solution = Board.from_file("puzzles/sudoku1_solved.txt")
    @board = Board.new(Board.from_file("puzzles/sudoku1.txt"))
  end

  def play
    while !solved?
      @board.render
      val = get_val
      pos = get_pos
     
      @board[pos] = val
    end
  end

  def solved?
    @board.grid == @solution
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

    pos.split("").map { |char| char.to_i }
  end

  def valid?(input)
    return false if input == nil

    input.split("").all? { |char| "1234567890".include?(char) }
  end
end

game = Sudoku.new

game.play