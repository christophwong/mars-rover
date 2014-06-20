class Rover
  attr_accessor :direction, :y, :x
  attr_reader :moves
  def initialize(args)
    @direction = args[:direction]
    @x = args[:x]
    @y = args[:y]
    @moves = args[:moves]   #"LMLMLMLMM"
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
    self.direction = case direction
    when 'N' then 'W'
    when 'W' then 'S'
    when 'S' then 'E'
    when 'E' then 'N'
    end
  end

  def turn_right
    self.direction = case direction
    when 'N' then 'E'
    when 'W' then 'N'
    when 'S' then 'W'
    when 'E' then 'S'
    end
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
