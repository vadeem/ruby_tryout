require_relative 'Route'
require_relative 'PassengerCar'
require_relative 'CargoCar'
require_relative 'Counter'
require_relative 'InfoModifier'
require_relative 'AllFinder'

class Train

  include InfoModifier
  include Counter
  include AllFinder
  
  #варианты типа поезда
  TRAIN_TYPE = { :passenger => 'Passenger', :freight => 'Cargo' }
  SPEED_CHANGE_VALUE = 10 #ускорение поезда, км\ч
  
  attr_reader	:route, :number, :speed, :type, :wagons_list

  def initialize( train_type = nil, route = nil, wagons_list = {})
    
    @type = train_type
    @wagons_list = wagons_list
    @speed = 0
    @number = self.object_id
    @route = route
    @current_station = route.get_route_start unless route.nil? #завожу для экономии времени на процедуру перебора всех станций
    self.register_instance
    self.add_one_instance(self)
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

=begin  
  def add_wagon
    #уточнить по поводу вызова класса по имени
      if 0 == self.speed
        car_class_name = self.type + 'Car'
        Object.const_get(car_class_name)
        wagon = Object.const_get(car_class_name).new();
        wagons_list[wagon.number] = wagon;
      else
        puts 'Состав в движении, невозможно прицепить вагон на ходу'
      end
    end
  end
=end

  def remove_wagon(number = nil)
  	if 0 == self.speed && self.wagons_list.any?
  		if number.nil?
    		wagons_list.shift;
    	else
    		wagons_list.delete(number){ |el| "Вагона №#{el} в составе нет" };
    	end
    else
    	puts 'Состав в движении, невозможно отцепить вагон на ходу'
    end
  end

  def show_train_stations
  	self.route.show_sorted_stations_list
  end
  
  protected #протектед т.к. нам нужно чтобы к этим полям имели доступ классы наследники, но при этом нельзя было напрямую получить доступ к переменной
  attr_accessor :current_station
  attr_writer   :route, :wagons_list, :speed
  
end