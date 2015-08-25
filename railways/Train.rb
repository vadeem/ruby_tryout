=begin
Поезд:
Имеет, тип, который указывается при создании: грузовой, пассажирский и количество вагонов.
Поезд может делать следующие вещи:
набирать скорость
показывать текущую скорость
тормозить
показывать количество вагонов
прицеплять/отцеплять вагоны (по одному вагону за операцию, метод просто увеличивает или уменьшает количество вагонов). 
Прицепка/отцепка вагонов может осуществляться только если поезд не движется.
Принимать маршрут следования
Перемещаться между станциями, указанными в маршруте.
Показывать предыдущую станцию, текущую, следующую, на основе маршрута
=end
require_relative 'Route'

class Train

  #варианты типа поезда
  TRAIN_TYPE = [ :passenger, :freight ]
  SPEED_CHANGE_VALUE = 10 #ускорение поезда, км\ч
  
	attr_reader		:train_number, :type, :wagons_count
	attr_accessor :route
	
	private
	attr_accessor :speed
	attr_writer   :wagons_count
	
	
	public
  def initialize( route = 'zaglushka', wagons = 1, train_type = :passenger)
    
    @type = train_type
    @wagons_count = wagons
    @speed = 0
    @train_number = self.object_id
    #@route = Route.new(route);
    
	end
 
	def speed_up
    self.speed += SPEED_CHANGE_VALUE 
	end
	
	def show_current_speed
    puts "Скорость поезда №#{self.train_number}: #{self.speed} км\ч"
	end
	
	def slow_down
    self.speed -= SPEED_CHANGE_VALUE
	end

	def show_current_station
    puts "Поезд №#{self.train_number} находится на станции #{self.route.current_station}"
	end

	def travel_next_station
		
	end

	def travel_back_to_last_station
		
	end

	def add_wagon
    self.wagons_count += 1;
	end

	def remove_wagon
    self.wagons_count -= 1;
	end

end