require_relative 'route.rb'
require_relative 'cargo_train.rb'
require_relative 'passenger_train.rb'
require_relative 'railway_station.rb'


begin
  #станции
  puts 'СТАНЦИИ'
  bolshevo_station  = RailwayStation.new('Bolshevo')
  monino_station    = RailwayStation.new('Monino')
  podlipki_station  = RailwayStation.new('Podlipki')
  
  puts bolshevo_station.name, monino_station.name, podlipki_station.name
  puts
  
  puts 'выведем список всех станций'
  puts RailwayStation.all
  
  puts 'меняем для Монино номер станции'
  puts monino_station.change_number(12)
  puts 'и снова выведем список всех станций'
  puts RailwayStation.all
  
  puts 'найдём станциюю Монино, по её названию номеру - 12 '
  puts RailwayStation.find(12).name
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
  tr = CargoTrain.new() #попробуем три вагона
  puts tr
  puts Train::TRAIN_TYPE[tr.type]
  puts 'установим для первого, грузового поезда название производителя - РЖД'
  tr.manufacturer = 'RZHD';
  puts 'проверим'
  puts tr.manufacturer
  puts
  
  puts 'добавим вагон в грузовой состав'
  wc1 = CargoCar.new(123456);
  tr.add_wagon(wc1)
  puts "Вагонов в составе #{tr.show_train_length}"
  
  puts 'пробуем прибавить скорости'
  
  tr.speed_up
  puts 'пробуем добавить вагон на скорости'
  
  begin
    wc2 = CargoCar.new(666333);
    tr.add_wagon(wc2)
  rescue Exception => e
    puts e
    puts 'притормозим'
    tr.slow_down
    puts 'и добавим вагон'
    tr.add_wagon(wc2)
  end
  puts "Теперь вагонов в составе #{tr.show_train_length}"
  
  #поезд пассажирский
  puts
  puts 'ПОЕЗДА:пассажирский'
  tr2 = PassengerTrain.new()
  puts tr2
  puts Train::TRAIN_TYPE[tr2.type]
  
  puts "вагонов в пассажирском составе #{tr2.show_train_length}"
  begin
    wp1 = PassengerCar.new(223332);
    tr2.add_wagon(wp1)
  rescue Exception => e
    puts e
    puts 'снова добавим вагон'
    tr2.add_wagon(wp1)
  end
    puts "Вагонов в составе #{tr2.show_train_length}"

  puts 'пробуем прибавить скорости'
  tr2.speed_up
  puts 'пробуем добавить вагон на скорости'
  begin
    wp2 = PassengerCar.new(475688);
    tr2.add_wagon(wp2)
  rescue Exception => e
    puts e
    puts 'притормозим'
    tr2.slow_down
    puts 'и добавим вагон'
    tr2.add_wagon(wp2)
  end
  puts "Теперь вагонов в составе #{tr2.show_train_length}"
  
  tr2.number
  
  #работа с путем - установка маршрута
  tr.set_route(route)
  tr2.set_route(route)
  
  #проверка кто из поездов (по номерам) находится на первой станции
  route.get_route_start.show_trains
  puts ''
  
  #грузовой едет в подлипки и обратно
  puts Train::TRAIN_TYPE[tr.type]
  tr.travel_next_station
  tr.travel_to_last_station
  puts
  
  #пассажирский едет через станцию
  puts 'тем временем пассажирский'
  tr2.travel_next_station
  puts tr2.show_current_station
  puts 'если это конечная, то попытка повторно поехать на следующую станцию вернёт ту же станцию'
  tr2.travel_next_station
  puts tr2.show_current_station
  puts Train::TRAIN_TYPE[tr2.type]
rescue Exception => e
  puts "ошибка: #{e}"
end