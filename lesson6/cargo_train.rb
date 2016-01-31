require_relative 'train.rb'
require_relative 'cargo_car.rb'

class CargoTrain < Train

  def initialize( route = nil, number = nil, wagons_list = {})
    super( :freight )
  end

end