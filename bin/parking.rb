#!/usr/bin/env ruby
require 'readline'
require 'pry'
require_relative '../lib/parking_lot'
require_relative '../lib/parking_slot'
require_relative '../lib/vehicle'


def execute_command(line)
  Dir[File.dirname(__FILE__) + '/lib/*.rb'].each {|file| require_relative file }
  params = line.strip.split(' ')
  command = params.first
  case command
  when 'create_parking_lot'
    @lot = ParkingLot.new(params[1].to_i)
  when 'park'
    @lot.find_and_park(params[1], params[2])
  when 'leave'
    @lot.leave(params[1].to_i)
  when 'status'
    @lot.status
  when 'registration_numbers_for_cars_with_colour'
    @lot.find_vehicle(params[1])
  when 'slot_numbers_for_cars_with_colour'
    @lot.find_slot_for_colour(params[1])
  when 'slot_number_for_registration_number'
    @lot.find_slot_for_reg_no(params[1])
  else
    p 'Invalid command'
  end

end

file_name = ARGV[0]

if file_name.nil?
  loop do
    line = Readline.readline('>>')
    execute_command(line)
  end
end

File.open(file_name, 'r') do |f|
  f.each_line do |line|
    execute_command(line)
  end
end
