require_relative 'train.rb'
require_relative 'passenger_car.rb'

class PassengerTrain < Train
  
  def initialize
    super
    @type = :passenger
  end
  
  def add_wagon
    if 0 == self.speed
      wagon = PassengerCar.new();
      self.wagons_list[wagon.number] = wagon;
    else
      puts 'Состав в движении, невозможно прицепить вагон на ходу'
    end
  end

end