class ParkingLot
  attr_reader :capacity, :parking_slots

  def initialize(capacity)
    @capacity = capacity
    @parking_slots = (1..capacity).collect do |slot_no|
      ParkingSlot.new(slot_no)
    end
    puts "Created a parking lot with #{capacity} slots"
  end

  def find_and_park(reg_no, colour)
    free_slots = self.parking_slots.select do |slot|
      slot.is_free?
    end
    return print_msg('Sorry, parking lot is full') if free_slots.empty?
    first_slot = free_slots.sort_by{|slot| slot.slot_number}.first
    first_slot.park(reg_no, colour)
  end

  def leave(slot_no)
    slot = parking_slots.select do |slot|
      slot.slot_number == slot_no
    end
    slot.first.unallocate
  end

  def find_vehicle(colour)
    slots = self.parking_slots.select do |slot|
      slot.is_allocated? && slot.vehicle_colour(colour)
    end
    return print_msg('Not found') if slots.empty?
    binding.pry
    collect_number(slots)
  end

  def collect_number(slots)
    reg_numbers = slots.collect do |slot|
      slot.vehicle_reg_no
    end
    p reg_numbers.join(',')
  end

  def find_slot_for_reg_no(reg_no)
    slots = self.parking_slots.select do |slot|
      slot.is_allocated? && slot.vehicle.match_reg_no(reg_no)
    end
    return print_msg('Not found') if slots.empty?
    puts slots.map(&:slot_number)
  end

  def find_slot_for_colour(colour)
    slots = self.parking_slots.select do |slot|
      slot.is_allocated? && slot.vehicle_colour(colour)
    end
    return print_msg('Not found') if slots.empty?
    puts slots.map(&:slot_number)
  end

  def status
    p "Slot No.  Registration No     Colour"
    self.parking_slots.each do |slot|
      p "#{slot.slot_number}    #{slot.vehicle.reg_number}   #{slot.vehicle.colour}" if slot.is_allocated?
    end
  end

  def print_msg(msg)
    p msg
  end
end