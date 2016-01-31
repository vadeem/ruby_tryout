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
  NUMBER_FORMAT = /^\w\d{3}(-?)\w\d\{2}$/i

  def initialize( train_type = nil, route = nil, number = nil, wagons_list = {})
    
    @type = train_type
    @wagons_list = wagons_list
    @speed = 0
    @number = number;
    @route = route
    @current_station = route.get_route_start unless route.nil? #завожу для экономии времени на процедуру перебора всех станций
    valid?
    
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
    speed 
  end

  def slow_down
    self.speed -= SPEED_CHANGE_VALUE
  end

  def show_current_station
    if( route.nil? )
      false
    else
      current_station.name
    end
  end

  def travel_next_station
    if( route.nil? )
      false
    else
      last_station = route.get_route_end

      if current_station == last_station 
        false
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
      false
    else
      first_station = route.get_route_start

      if current_station == first_station
        false
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
        wagons_list.delete(number){ nil };
      end
    else
      false
    end
  end

  def show_train_length
    wagons_list.length + 1 #+1 это сам паровоз\тепловоз\электровоз
  end
  
  def add_wagon( wagon = nil)
    validate_car(wagon)
    if wagon.type == type
      if 0 == self.speed
        self.wagons_list[wagon.number] = wagon;
      else
        raise "Поезд в пути, остановите перед добавлением вагонов"
      end 
    else 
      raise "Неверный тип вагонов"
    end
  end
  
  def valid?
    validate!
  rescue
    false
  end
  
  protected #протектед т.к. нам нужно чтобы к этим полям имели доступ классы наследники, но при этом нельзя было напрямую получить доступ к переменной
  attr_writer :route, :wagons_list, :speed

  attr_accessor :current_station

  def validate!
    raise "Неверный формат номера" unless number =~ NUMBER_FORMAT
    raise "Номер указан как nil" if number.nil?
    raise "Тип не должен быть nil" if type.nil?
    raise "Неверный тип поезда" unless TRAIN_TYPE.key?(type)
    true
  end
  
  def validate_car(car)
    raise "Не предоставлен объект Вагон" if car.nil?
    raise "неверный формат вагона" if type != car.type
  end
  
end