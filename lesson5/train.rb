require_relative 'route.rb'
require_relative 'railway_station.rb'
require_relative 'info_modifier.rb'
require_relative 'all_finder.rb'

class Train

  include InfoModifier
  include AllFinder
  
  attr_reader :route, :number, :speed, :type, :wagons_list
  
  #варианты типа поезда
  TRAIN_TYPE = { :passenger => 'пассажирский', :freight => 'грузовой' }
  SPEED_CHANGE_VALUE = 10 #величина изменения скорости поезда, км\ч

  def initialize( train_type = :passenger, wagons_list = {}, route = nil, number = nil )
    
    @type = train_type
    @wagons_list = wagons_list
    @speed = 0
    if(number.nil?)
      @number = self.object_id;
    else
      @number = number;
    end
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

  def show_train_stations
  	route.show_sorted_stations_list
  end
  
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

  def show_train_length
    wagons_list.length + 1 #+1 это сам паровоз\тепловоз\электровоз
  end
  
  protected #протектед т.к. нам нужно чтобы к этим полям имели доступ классы наследники, но при этом нельзя было напрямую получить доступ к переменной
  attr_writer :route, :wagons_list, :speed

  attr_accessor :current_station
  
end