require_relative 'info_modifier.rb'

class Car

  include InfoModifier
  
  attr_reader :number, :type

  def initialize(type, number)
    @number = number;
    @type = type#тип вагона
    valid?
  end

  def valid?
    validate!
  rescue
    false
  end
  
  protected
  def validate!
    raise "Номер должен быть длиннее 5 символов" if number.length < 6
    raise "Тип не должен быть nil" if type.nil?
    raise "Неверный тип предназначения" unless AVAILABLE_FOR == type
    true
  end
end