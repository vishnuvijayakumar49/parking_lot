class ParkingSlot
	attr_reader :slot_number, :status, vehicle

	def initializer(slot_number)
		@slot_number = slot_number
		@status = 'free'
	end
end