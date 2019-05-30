require "colorize"

class Tile
  attr_reader :given
  attr_accessor :val

  def initialize(val, given)
    @val = val
    @given = given
  end

  def ==(val)
    @val == val
  end

  def colorize(color)
    @val.colorize(color)
  end
end