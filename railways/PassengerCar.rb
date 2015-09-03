require_relative 'Car'

#определения приватности и публичности переменных и функций аналогично CargoCar
class PassengerCar < Car 
	
  AVAILABLE_FOR = :passenger # train
	
	attr_reader 	:number, :type, :boarding_places_count, :passengers_count
	
	private
	attr_writer	  :passengers_count 
	
	public
	def initialize(boarding_places_count = 30)
    @number                 = self.object_id
		@type 					        = AVAILABLE_FOR 
		@passengers_count 		  = 0 
		@boarding_places_count  = boarding_places_count
	end
	
	def add_passenger
		if self.passengers_count >= self.boarding_places_count
			puts 'Already reached passengers limit'
		else
			self.passengers_count += 1
		end
	end
	
end