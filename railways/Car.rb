class Car

  #константа показывающая тип состава для которого используется наш вагон - в данном случае nil, т.к. будем определять в наследниках
	AVAILABLE_FOR = nil
	
	attr_reader :number, :type
	
	#абстрактный класс - приватный конструктор
	private
	def initialize( type= nil )
		@number = self.object_id
		@type = nil#тип вагона
	end
	
	#некая функция доступная для классов наследников
	public
	def available_for?(type)
		return type == self.AVAILABLE_FOR && ! type.nil?
	end

end