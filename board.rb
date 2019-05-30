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
    @grid.each_with_index do |row, i|
      if @solved_rows.include?(i)
        readable_row = row.map do |tile|
          if tile.given
            tile.colorize(:red)
          else
            tile.colorize(:green)
          end
        end
      else
        readable_row = row.map.with_index do |tile, i|
          if tile == "0"
            "-"
          elsif tile.given
            tile.colorize(:red)
          elsif @solved_cols.include?(i)
            tile.colorize(:green)
          else
            tile.val
          end
        end
      end

      print readable_row.join(" ")
      puts
    end
  end

  def solved?
    @solved_rows, @solved_cols, @solved_regs = [], [], []
    row_solved? && col_solved? && reg_solved?
  end

  def row_solved?
    @grid.each_with_index do |row, i|
      solved = (1..9).all? do |num|
        row.any? { |tile| tile == num.to_s }
      end
      if solved
        @solved_rows << i
      end
    end
  end

  def col_solved?
    (0..8).each do |i|
      solved = (1..9).all? do |num|
        @grid.any? { |row| row[i] == num.to_s }
      end
      if solved
        @solved_cols << i
      end
    end
  end

  def reg_solved?

  end
end