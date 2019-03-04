class ParkingLot
  attr_reader :capacity

  def initializer(capacity)
    @capacity = capacity
    @parking_slots = (1..capacity).collect do |i|
      ParkingSlot.new(i)
    end
    puts "Created a parking lot with #{capacity} slots"
  end
end