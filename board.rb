require_relative "tile"

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
      row_solved = row_solved?(row)

      output = row.map.with_index do |tile, i|
        if tile == "0"
          "-"
        elsif tile.given
          tile.colorize(:red)
        elsif row_solved || col_solved?(i)
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
    false
  end

  def row_solved?(row)
    solved = (1..9).all? do |num|
      row.any? { |tile| tile == num.to_s }
    end
  end

  def col_solved?(i)
    solved = (1..9).all? do |num|
      @grid.any? { |row| row[i] == num.to_s }
    end
  end

  def reg_solved?

  end
end