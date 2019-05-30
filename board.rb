require "colorize"

class Board
  attr_reader :grid

  def initialize(grid)
    @grid = grid
  end

  def self.from_file(file)
    array = []
    
    File.open(file, "r") do |f|
      f.each_line do |line|
        array << line.chomp.split("")
      end
    end

    array
  end

  def place(position)

  end

  def render
    @grid.each do |row|
      readable_row = row.map do |char|
        if char == "0"
          "-"
        else 
          char.colorize(:red)
        end
      end
      print readable_row.join(" ")
      puts
    end
  end

  def solved?
    row_solved?
    col_solved?
    reg_solved?
  end
end