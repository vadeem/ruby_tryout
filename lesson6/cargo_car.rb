require_relative 'car.rb'

class CargoCar < Car
  
  AVAILABLE_FOR = :freight # train

  attr_reader :tonnage, :cargo_weight
  
  def initialize(number, tonnage = 20, cargo_weight = 0)
    super( AVAILABLE_FOR,  number )
    @cargo_weight   = cargo_weight 
    @tonnage        = tonnage
  end
  
  def load_cargo
    if self.cargo_weight >= self.tonnage
      puts 'Вагон полностью загружен'
    else
      self.cargo_weight += 1
    end
  end
  
  #функция load cargo занимается загрузкой вагона, так что убираем возможность напрямую модифицировать значение
  private
  attr_writer   :cargo_weight
  
end