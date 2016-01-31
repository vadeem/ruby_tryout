require_relative 'railway_station.rb'

class Route
  
  def initialize(first_station, last_station, other_stations = [])
  	
  	@stations_list = [first_station]
  	
  	if( other_stations.any? )
  	  other_stations.each {|station| @stations_list << station }
  	end
  	
  	@stations_list << last_station
  	valid?
  end
  
  def get_route_end
  	stations_list.last
  end
  
  def get_route_start
  	stations_list.first
  end
  
  def add_station_to_route(station, station_route_index = -2)
    stations_list.insert(station_route_index, station)
  end
  
  def remove_station(station_to_delete)
    stations_list.delete_if {|station| 
      station.name ==  station_to_delete.name
    }
  end
  
  def get_next_station(prev_station)
    result = nil
    
    stations_list.each_index{ |station_index|
      if stations_list[station_index].name == prev_station.name
        result = stations_list[station_index + 1] 
      end
    }
    
    unless result.nil?
      return result
    else
      prev_station.name
    end
  end
  
  def get_prev_station(next_by_station)
    result = nil
    
    stations_list.each_index{ |station_index|
      if stations_list[station_index].name == next_by_station.name
        result = stations_list[station_index - 1] 
      end
    }
    
    unless result.nil?
      return result
    else
      prev_station.name
    end
  end
  
  def show_sorted_stations_list
    
    last_station = stations_list.last
    stations_list.each { |station|
    	
    	#печатаем путь в виде stname1 + stname2 + stname3 и т.п. до последней станции
    	print station.name 
    	print ' + ' if station != last_station
    }
  end
  

  private #чтобы меняли список только методами
  attr_accessor :stations_list
  
  def valid?
    validate!
  rescue
    false
  end
  
  private 
  #раз у нас есть функции добавить и убрать станцию из пути, надо сделать список станций приватным, 
  #а раз список станций приватный, пришлось добавить функции - get_next_station и get_previous_station, так как поездам нужно иметь возможность получить станции
  attr_accessor :stations_list
  
  protected
  def validate!
    raise "Список станций пути должен содержать не менее двух станций" if station_list.length < 2
    station_list.each{|station| raise "Один из объектов не является экземпляром класса Станция" unless station.class == 'RailwayStation'}
    true
  end

end