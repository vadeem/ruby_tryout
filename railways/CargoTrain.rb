require_relative 'Train.rb'

class CargoTrain < Train

  def initialize( train_type = :freight, route = nil, wagons_list = {})
      
      @type = train_type
      @wagons_list = wagons_list
      @speed = 0
      @number = self.object_id
      @route = route
      @current_station = route.get_route_start unless route.nil? #завожу для экономии времени на процедуру перебора всех станций
       
  end
    
  def add_wagon
    if 0 == self.speed
      wagon = CargoCar.new();
      self.wagons_list[wagon.number] = wagon;
    else
      puts 'Состав в движении, невозможно прицепить вагон на ходу'
    end
  end

end