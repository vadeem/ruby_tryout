class Car

  attr_reader :number, :type

  def initialize(type = nil)
    @number = self.object_id
    @type = type#тип вагона
  end

end