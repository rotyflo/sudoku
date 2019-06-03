require_relative "tile"

class Board
  attr_reader :solved
  attr_accessor :grid

  def initialize(grid)
    @grid = grid
    @solved = false
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

    @grid.each_with_index do |row, y|
      row_solved = row_solved?(row)

      output = row.map.with_index do |tile, x|
        if tile == "0"
          "-"
        elsif tile.given
          tile.colorize(:red)
        elsif row_solved || col_solved?(x) || reg_solved?(x, y)
          tile.colorize(:green)
        else
          tile.val
        end
      end

      print output.join(" ")
      puts
    end
  end

  def solved?
    (0..8).all? do |y|
      (0..8).all? do |x|
        row_solved?(@grid[y]) && col_solved?(x) && reg_solved?(x, y)
      end
    end
  end

  def row_solved?(row)
    solved = (1..9).all? do |num|
      row.any? { |tile| tile == num.to_s }
    end
  end

  def col_solved?(x)
    solved = (1..9).all? do |num|
      @grid.any? { |row| row[x] == num.to_s }
    end
  end

  def reg_solved?(x, y)
    first_x = (x / 3) * 3
    first_y = (y / 3) * 3

    solved = (1..9).all? do |num|
      (first_x..first_x + 2).any? do |x_i|
        (first_y..first_y + 2).any? do |y_i|
          @grid[x_i][y_i] == num.to_s
        end
      end
    end
  end
end