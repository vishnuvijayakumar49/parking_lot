class Vehicle
  attr_accessor :colour, :reg_number

  def initialize(reg_number, colour)
    @reg_number = reg_number
    @colour = colour
  end

  def check_colour(colour)
    self.colour == colour
  end

  def match_reg_no(num)
    reg_number == num
  end
end