Dir[File.dirname(__FILE__) + '/lib/*.rb'].each {|file| require file }

def execute_command(line)
  params = line.strip.split(' ')
  command = params.first
  case command
  when 'create_parking_lot'
    @lot = ParkingLot.new(params[1].to_i)
  when 'park'
    @lot.find_and_park(params[1], params[2])
  when 'leave'
    @lot.leave(params[0].to_i)
  when 'status'
    @lot.status
  when 'registration_numbers_for_cars_with_colour'
    @lot.find_vehicle(params[1])
  when 'slot_numbers_for_cars_with_colour'
    @lot.find_slot(params[1])
  end
end