require_relative "tile"
require "colorize"

class Board
  attr_reader :grid
  attr_writer :grid

  def initialize(grid)
    @grid = grid
  end

  def self.from_file(file)
    array = []
    
    File.open(file, "r") do |f|
      f.each_line do |line|
        subarr = []

        line.chomp.split("").each do |char|
          given = true
          given = false if char == "0"

          subarr << Tile.new(char, given)
        end
        
        array << subarr
      end
    end

    array
  end

  def []=(pos, val)
    x, y = pos

    @grid[y][x].val = val
  end

  def [](pos)
    x, y = pos

    @grid[y][x]
  end

  def render
    system("clear")
    @grid.each do |row|
      readable_row = row.map do |tile|
        if tile == "0"
          "-"
        elsif tile.given
          tile.val.colorize(:red)
        else
          tile.val
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