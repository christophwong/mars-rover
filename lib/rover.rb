require_relative 'direction'
require_relative 'north'

class Rover
  attr_accessor :y, :x
  attr_reader :moves
  attr_writer :direction
  def initialize(args)
    @direction = Direction.new(args[:direction])
    @x = args[:x]
    @y = args[:y]
    @moves = args[:moves]   #"LMLMLMLMM"
  end

  def direction
    @direction.to_s
  end

  def run
    command_sequence = moves.split('')
    command_sequence.each do |move|
      case move
      when 'L'
        turn_left
      when 'R'
        turn_right
      when 'M'
        moves_forward
      end
    end
  end

  def turn_left
    @direction.turn_left
  end

  def turn_right
    @direction.turn_right
  end

  def moves_forward
    case direction
    when 'N'
      self.y += 1
    when 'W'
      self.x -= 1
    when 'S'
      self.y -= 1
    when 'E'
      self.x += 1
    end
  end

  def report_location
    "#{self.x} #{self.y} #{self.direction}"
  end
end
