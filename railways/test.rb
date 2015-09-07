require_relative 'Route.rb'

require_relative 'PassengerCar.rb'
require_relative 'CargoCar.rb'

require_relative 'Train.rb'
require_relative 'CargoTrain.rb'
require_relative 'PassengerTrain.rb'

require_relative 'RailwayStation.rb'


#станции
puts 'СТАНЦИИ'
bolshevo_station  = RailwayStation.new('Bolshevo')
monino_station    = RailwayStation.new('Monino')
podlipki_station  = RailwayStation.new('Podlipki')

puts bolshevo_station.name, monino_station.name, podlipki_station.name
puts

#путь
puts 'ПУТЬ'
route = Route.new(bolshevo_station, monino_station)

route.show_sorted_stations_list
puts 
puts route.get_route_start
puts route.get_route_end
puts
puts route.add_station_to_route(podlipki_station)
puts
puts '___'
puts
puts 'следующая после болшево'
puts route.get_next_station(bolshevo_station)

puts 'конечная монино, что выводит скрипт?'
puts route.get_next_station(monino_station)
puts
puts '___'
puts route.remove_station(podlipki_station)
puts
puts '___'

route.show_sorted_stations_list
puts 
puts

#поезд грузовой
puts 'ПОЕЗДА: грузовой'
tr = CargoTrain.new()
puts tr
puts tr.type

tr.add_wagon
puts tr.wagons_list

#пробуем добавить на скорости
tr.speed_up
tr.add_wagon

puts 'притормозим'
tr.slow_down
tr.add_wagon
puts tr.wagons_list

#поезд пассажирский
puts
puts 'ПОЕЗДА:пассажирский'
tr2 = PassengerTrain.new()
puts tr2
puts tr2.type

tr2.add_wagon
puts tr2.wagons_list

#пробуем добавить на скорости
tr2.speed_up
tr2.add_wagon

puts 'притормозим'
tr2.slow_down
tr2.add_wagon
puts tr2.wagons_list

#работа с путем - установка маршрута
tr.set_route(route)
tr2.set_route(route)

#проверка кто из поездов (по номерам) находится на первой станции
route.get_route_start.show_trains
puts

#грузовой едет в подлипки и обратно
puts 'грузовой'
tr.travel_next_station
tr.travel_to_last_station
puts tr.type

#пассажирский едет через станцию
puts 'тем временем пассажирский'
tr2.travel_next_station
tr2.travel_next_station
puts tr2.type