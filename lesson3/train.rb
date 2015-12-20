require_relative 'route.rb'
require_relative 'railway_station.rb'

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
    @number ||= object_id;
    @route = route
    @current_station = route.get_route_start unless route.nil? #завожу для экономии времени на процедуру перебора всех станций
  end

  def set_route( route )
  	self.route = route
  	self.route.get_route_start.accept_train(self)
  	self.current_station = route.get_route_start
  end

  def speed_up
    self.speed += SPEED_CHANGE_VALUE 
  end
	
  def show_current_speed
    puts "Скорость поезда №#{number}: #{speed} км\ч" 
  end

  def slow_down
    self.speed -= SPEED_CHANGE_VALUE
  end

  def show_current_station
    if( route.nil? )
      puts 'Поезд не имеет маршрутного листа'
    else
      puts "Поезд №#{number} находится на станции #{current_station.name}"
    end
  end

  def travel_next_station
  	if( route.nil? )
  		puts 'Необходимо завести путевой лист (маршрут)'
  	else
  		last_station = route.get_route_end
  		
  		if current_station == last_station 
  			puts 'Поезд на конечной'
  		else
  			current_station.train_departure(self)
  			#следующая станция
  			self.current_station = self.route.get_next_station( self.current_station )
  			self.current_station.accept_train( self )
  		end
  	end
  end

  def travel_to_last_station
  	if( route.nil? )
  		puts 'Необходимо завести путевой лист (маршрут)'
  	else
  		first_station = route.get_route_start
  		
  		if current_station == first_station 
  			puts 'Поезд уже в начале маршрута'
  		else
  			current_station.train_departure(self)

  			#предыдущая станция
  			self.current_station = route.get_prev_station( self.current_station )
  			self.current_station.accept_train( self )
  		end
  	end
  end
  
  def add_wagon
    if 0 == speed
      self.wagons_count += 1;
    else
      puts 'Состав в движении, невозможно подцепить вагон на ходу'
    end
  end
  
  def remove_wagon
    if 0 == speed && 0 != wagons_count
      self.wagons_count =- 1
    else
      puts 'Состав в движении, невозможно отцепить вагон на ходу'
    end
  end

  def show_train_stations
  	route.show_sorted_stations_list
  end
    
end