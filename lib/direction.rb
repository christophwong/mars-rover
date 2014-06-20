class Direction
  attr_accessor :direction
  def initialize(direction)
    @direction = case direction
    when 'N' then North.new
    when 'E' then East.new
    when 'S' then South.new
    when 'W' then West.new
    end

  end

  def turn_left
    self.direction = @direction.turn_left
  end

  def turn_right
    self.direction = @direction.turn_right
  end

  def to_s
    @direction.to_s
  end
end


class North
  def turn_left
    West.new
  end

  def turn_right
    East.new
  end

  def to_s
    'N'
  end
end


class East
  def turn_left
    North.new
  end

  def turn_right
    South.new
  end

  def to_s
    'E'
  end
end


class South
  def turn_left
    East.new
  end

  def turn_right
    West.new
  end

  def to_s
    'S'
  end
end


class West
  def turn_left
    South.new
  end

  def turn_right
    North.new
  end

  def to_s
    'W'
  end
end

