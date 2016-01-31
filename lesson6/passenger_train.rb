require_relative 'train.rb'
require_relative 'passenger_car.rb'

class PassengerTrain < Train
  
  def initialize( route = nil, number = nil, wagons_list = {})
    super( :passenger)
  end

end