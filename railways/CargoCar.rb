require_relative 'Car'


class CargoCar < Car
	
	AVAILABLE_FOR = :freight # train
	
	#отмечу геттер для cargo_weight, он публичный, чтобы можно было посмотреть сколько вагон везёт груза
	attr_reader :tonnage, :cargo_weight
	
	public
	def initialize(tonnage = 20)
	  super
		@cargo_weight		= 0 
		@tonnage  			= tonnage
	end
	
	def load_cargo
		if self.cargo_weight >= self.tonnage
			puts 'Already reached max cargo weight'
		else
			self.cargo_weight += 1
		end
	end
	
  #кол-во груза мы будем модифицировать через load_cargo, так что запись приватна.
  private
  attr_writer   :cargo_weight
	
end