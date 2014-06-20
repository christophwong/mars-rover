class Rover
  attr_accessor :direction

  def initialize(args)
    @direction = args[:direction]
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
end
