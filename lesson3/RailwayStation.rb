require_relative 'RailwayStation'

class RailwayStation

	attr_accessor  :name, :trains_list

	def initialize( name )
		@name = name
		@trains_list = Hash.new(nil)
	end
	
	#метод показывает список поездов по типу или (если тип не указать) список всех поездов
	def show_trains( type=nil )
		no_trains = true
		if self.trains_list.any?
  		self.trains_list.each do |train_id, train|
  		  if type.nil? 
  		    puts "На станции находится поезд № #{train_id}"
  			elsif( train.type == type)
  				no_trains = false
  				puts "На станции находится #{Train::TRAIN_TYPE[train.type]} поезд № #{train_id} " if train.type == type
  			end
  		end
  	end
  	
  	puts 'no trains at station now' if no_trains && ! type.nil?
	end

	def train_departure( train )
		self.trains_list.delete(train.number)
		puts "Поезд №#{train.number} отбыл со станции #{self.name}"
	end

	def has_train?( train_id )
		if self.trains_list[train_id]
			true
		else
			false
		end
	end
	
	def accept_train( train )
		unless self.trains_list[train.number]
			self.trains_list[train.number] = train
			puts "Поезд №#{train.number} прибыл на станцию #{self.name}"
		else
			self.trains_list[train.number]
			puts "Поезд №#{train.number} уже находится на станции #{self.name}"
		end
	end
	
end