=begin
Станция:
Имеет название, которое указывается при ее создании
Может принимать поезда
Может показывать список всех поездов на станции, находящиеся в текущий момент
Может показывать список поездов на станции по типу (см. ниже): кол-во грузовых, пассажирских
Может отправлять поезда (при этом, поезд удаляется из списка поездов, находящихся на станции).
=end
class RailwayStation
	attr_reader    :name
	#attr_accessor  :trains_hash

  def show_trains_ids
    
  end
  
  def show_trains( type )
		
	end

	def train_departure
		
	end
	
	def accept_train
	  
	end
	
end
