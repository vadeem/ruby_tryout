require_relative 'car.rb'

class PassengerCar < Car 

  AVAILABLE_FOR = [:passenger] # train

  attr_reader   :boarding_places_count, :passengers_count

  def initialize(boarding_places_count = 30)
    super
    @passengers_count       = 0 
    @boarding_places_count  = boarding_places_count
  end
  
  def add_passenger
    if self.passengers_count >= self.boarding_places_count
      puts 'В вагоне уже нет мест'
    else
      self.passengers_count += 1
    end
  end
  
  def unload_passengers
    self.passengers_count = 0;
  end

  private
  attr_writer   :passengers_count 

end