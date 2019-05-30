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
    end
  end

  def solved?
    @board.grid == @solution
  end

  def get_val
    gets.chomp
  end

  def get_pos
    gets.chomp
  end
end

game = Sudoku.new

game.play