require_relative 'plateau'
require_relative 'rover'

class Controller
  attr_accessor :commands, :width, :height

  def initialize(input)
    @commands = input.split #["5", "5", "1", "2", "N", "LMLMLMLMM", "3", "3", "E", "MMRMMRMRRM"]
    parse_commands
    @rover = []
    land_rovers
  end

  private

  def parse_commands
    @width = commands.shift.to_i
    @height = commands.shift.to_i
    @plateau = Plateau.new({x: self.width, y: self.height})
  end

  def land_rovers
    @commands.each_slice(4) do |x, y, direction, moves|
      @rover << Rover.new({x: x.to_i, y: y.to_i, direction: direction, moves: moves})
    end
  end
end
