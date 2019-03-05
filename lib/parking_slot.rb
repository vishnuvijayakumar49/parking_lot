class ParkingSlot
  attr_accessor :slot_number, :status, :vehicle

  def initialize(slot_number)
    @slot_number = slot_number
    @status = 'free'
  end

  def is_free?
    status == 'free'
  end

  def is_allocated?
    status == 'allocated'
  end

  def unallocate
    self.status = 'free'
    self.vehicle = nil
    puts "Slot number #{slot_number} is free"
  end

  def vehicle_colour(colour)
    vehicle.check_colour(colour)
  end

  def vehicle_reg_no
    self.vehicle.reg_number
  end

  def park(reg_no, colour)
    @status = 'allocated'
    @vehicle = Vehicle.new(reg_no, colour)
    puts "Allocated slot number: #{slot_number}"
  end
end