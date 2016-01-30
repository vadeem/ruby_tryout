require_relative 'info_modifier.rb'

class Car

  include InfoModifier
  
  attr_reader :number, :type

  def initialize(type = nil, number = nil)
    if(number.nil?)
      @number = self.object_id;
    else
      @number = number;
    end
    @type = type#тип вагона
  end

end