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
  
  attr_reader	:number, :type, :wagons_count
  attr_accessor :speed, :route, :current_station
  attr_writer   :wagons_count
  
  def initialize( wagons = 1, train_type = :passenger, route = nil)
    
    @type = train_type
    @wagons_count = wagons
    @speed = 0
    @number = self.object_id
    @route = route
    @current_station = route.get_route_start if route.any? #завожу для экономии времени на процедуру перебора всех станций 
  end
  
  def set_route( route )
	self.route = route
	self.route.get_route_start.accept_train(self)
	self.current_station = self.route.get_route_start
  end

  def speed_up
    self.speed += SPEED_CHANGE_VALUE 
  end
	
  def show_current_speed
    puts "Скорость поезда №#{self.number}: #{self.speed} км\ч" 
  end

  def slow_down
    self.speed -= SPEED_CHANGE_VALUE
  end

  def show_current_station
  	
  	if( self.route.nil? )
		puts 'Поезд не имеет маршрутного листа'
  	else
  		puts "Поезд №#{self.number} находится на станции #{self.current_station.name}"
  	end
  end

  def travel_next_station
  	if( self.route.nil? )
		puts 'Необходимо завести путевой лист (маршрут)'
	else
		last_station = self.route.get_route_end
		
		if self.current_station == last_station 
			puts 'Поезд на конечной'
		else
			self.current_station.train_departure(self)
			cur_station_index = self.route.stations_list.index( self.current_station )
			
			#следующая станция
			self.current_station = self.route.stations_list.at(cur_station_index + 1)
			self.current_station.accept_train( self )
		end
  	end
  end

  def travel_back_to_last_station
	if( self.route.nil? )
		puts 'Необходимо завести путевой лист (маршрут)'
	else
		first_station = self.route.get_route_start
		
		if self.current_station == first_station 
			puts 'Поезд уже в начале маршрута'
		else
			self.current_station.train_departure(self)
			cur_station_index = self.route.stations_list.index( self.current_station )
			
			#следующая станция
			self.current_station = self.route.stations_list.at(cur_station_index - 1)
			self.current_station.accept_train( self )
		end
  	end
  end

  def add_wagon
  	if ! self.speed
    	self.wagons_count += 1;
    else
    	puts 'Состав в движении, невозможно прицепить вагон на ходу'
    end
  end

  def remove_wagon
  	if ! self.speed
    	self.wagons_count -= 1;
    else
    	puts 'Состав в движении, невозможно отцепить вагон на ходу'
    end
  end

  def show_train_stations
  	self.route.show_sorted_stations_list
  end
end