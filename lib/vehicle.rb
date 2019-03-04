def Vehicle
  attr_reader :colour, :reg_number

  def initializer(reg_number, colour)
    @reg_number = reg_number
    @color = colour
  end
end