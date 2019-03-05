def Vehicle
  attr_reader :colour, :reg_number

  def initializer(reg_number, colour)
    @reg_number = reg_number
    @colour = colour
  end

  def check_colour(colour)
    self.colour == colour
  end

  def match_reg_no(num)
    self.reg_number == num
  end
end