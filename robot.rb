class Robot
  X_COORDINATES = (0..4)
  Y_COORDINATES = (0..4)
  POSITIONS = %w(NORTH EAST SOUTH WEST)

  def place(x_coordinate, y_coordinate, position)
    self.x_coordinate = x_coordinate
    self.y_coordinate = y_coordinate
    self.position = position
  end

  def report
    validate_location
    puts "# Output: #{@x_coordinate},#{@y_coordinate},#{@position}"
  end

  def move
    validate_location
    case @position
      when 'NORTH'
        self.y_coordinate = @y_coordinate + 1
      when 'SOUTH'
        self.y_coordinate = @y_coordinate - 1
      when 'EAST'
        self.x_coordinate = @x_coordinate + 1
      when 'WEST'
        self.x_coordinate = @x_coordinate - 1
    end
  end

  def left
    validate_location
    self.position = POSITIONS[POSITIONS.index(@position) - 1]
  end

  def right
    validate_location
    self.position = POSITIONS[POSITIONS.index(@position) + 1] || POSITIONS[0]
  end

  private

    def x_coordinate=(x_coordinate)
      validate_value('X coordinate', x_coordinate, X_COORDINATES)
      @x_coordinate = x_coordinate
    end

    def y_coordinate=(y_coordinate)
      validate_value('Y coordinate', y_coordinate, Y_COORDINATES)
      @y_coordinate = y_coordinate
    end

    def position=(position)
      validate_value('Position', position, POSITIONS)
      @position = position
    end

    def validate_value(value_name, value, arr)
      unless arr.include?(value)
        raise "#{value_name} should be in range #{arr}"
      end
    end

    def validate_location
      unless @x_coordinate && @y_coordinate && @position
        raise 'Please place the robot first'
      end
    end
end
