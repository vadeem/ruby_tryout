=begin
Маршрут:
Имеет начальную и конечную станцию, а также список промежуточных станций
Может добавлять станцию в список
Может удалять станцию из списка
Может выводить список всех станций по-порядку от начальной до конечной
=end

require_relative 'RailwayStation'

class Route

  attr_accessor :stations_list
  
  #принимаем первую и последнюю станцию, а остальные массивом, 
  #хотя в принципе изначально начальная, конечная и промежуточные станции - какая-то кривая схема.
  #я бы предпочёл просто список станций, минимальной длинной в две станции (конечная и начальная)
  def initialize(first_station, last_station, other_stations = [])
  	
  	@stations_list = [first_station]
  	
  	if( other_stations.any? )
  	  other_stations.each {|station| @stations_list << station }
  	end
  	
  	@stations_list << last_station
  	
  end
  
  def get_route_end
  	self.stations_list.last
  end
  
  def get_route_start
  	self.stations_list.first
  end
  
  def add_station_to_route( station, station_route_index = -2)
	self.stations_list.insert(station_route_index, station)
  end
  
  def show_sorted_stations_list
    #какая тут может быть сортировка?
    last_station = stations_list.last
    self.stations_list.each { |station|
    	
    	#печатаем путь в виде stname1 + stname2 + stname3 и т.п. до последней станции
    	print station.name 
    	print ' + ' if station != last_station
    	
    }
  end
end