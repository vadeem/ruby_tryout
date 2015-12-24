require_relative 'car.rb'

class CargoCar < Car
  
  AVAILABLE_FOR = [:freight] # train

  attr_reader :tonnage, :cargo_weight
  
  public
  def initialize(tonnage = 20, cargo_weight = 0)
    super( :freight )
    @cargo_weight   = 0 
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