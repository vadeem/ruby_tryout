require_relative 'Train.rb'

class CargoTrain < Train

  def initialize
    super
    @type = :freight
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