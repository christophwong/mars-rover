require_relative 'plateau'
require_relative 'rover'

class Controller
  attr_accessor :commands, :width, :height, :rovers

  def initialize(input)
    @commands = input.split #["5", "5", "1", "2", "N", "LMLMLMLMM", "3", "3", "E", "MMRMMRMRRM"]
    parse_commands
    @rovers = []
    land_rovers
  end

  def run_all_rovers
    rovers.each do |rover|
      rover.run
    end
  end

  def mission_report
    run_all_rovers
    final_locations = []
    rovers.each do |rover|
      final_locations << rover.report_location
    end
    final_locations.join("\n")
  end

  private

  def parse_commands
    @width = commands.shift.to_i
    @height = commands.shift.to_i
    @plateau = Plateau.new({x: self.width, y: self.height})
  end

  def land_rovers
    @commands.each_slice(4) do |x, y, direction, moves|
      @rovers << Rover.new({x: x.to_i, y: y.to_i, direction: direction, moves: moves})
    end
  end
end
