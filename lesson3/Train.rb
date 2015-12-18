require_relative 'Route'
require_relative 'RailwayStation'

class Train
  
  attr_accessor :route, :current_station, :speed, :wagons_count
  attr_reader :number, :type
  
  #варианты типа поезда
  TRAIN_TYPE = { :passenger => 'пассажирский', :freight => 'грузовой' }
  SPEED_CHANGE_VALUE = 10 #величина изменения скорости поезда, км\ч

  def initialize( train_type = :passenger, wagons = 1, route = nil)
    
    @type = train_type
    @wagons_count = wagons
    @speed = 0
    @number ||= self.object_id;
    @route = route
    @current_station = route.get_route_start unless route.nil? #завожу для экономии времени на процедуру перебора всех станций
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
  			#следующая станция
  			self.current_station = self.route.get_next_station( self.current_station )
  			self.current_station.accept_train( self )
  		end
  	end
  end

  def travel_to_last_station
  	if( self.route.nil? )
  		puts 'Необходимо завести путевой лист (маршрут)'
  	else
  		first_station = self.route.get_route_start
  		
  		if self.current_station == first_station 
  			puts 'Поезд уже в начале маршрута'
  		else
  			self.current_station.train_departure(self)

  			#предыдущая станция
  			self.current_station = self.route.get_prev_station( self.current_station )
  			self.current_station.accept_train( self )
  		end
  	end
  end
  
  def add_wagon
    if 0 == self.speed
      self.wagons_count += 1;
    else
      puts 'Состав в движении, невозможно подцепить вагон на ходу'
    end
  end
  
  def remove_wagon
    if 0 == self.speed && 0 != self.wagons_count
      self.wagons_count =- 1
    else
      puts 'Состав в движении, невозможно отцепить вагон на ходу'
    end
  end

  def show_train_stations
  	self.route.show_sorted_stations_list
  end
    
end