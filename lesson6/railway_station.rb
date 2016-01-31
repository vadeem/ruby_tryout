require_relative 'train.rb'
require_relative 'all_finder.rb'

class RailwayStation

  include AllFinder
  
  attr_accessor  :name, :trains_list
  attr_reader :number
  
  def initialize( name )
    @name = name
    @trains_list = Hash.new(nil)
    @number = self.object_id;
    self.add_one_instance(self)
    valid?
  end
  
  #метод показывает список поездов по типу или (если тип не указать) список всех поездов
  def show_trains( type=nil )
    no_trains = true
    if trains_list.any?
      trains_list.each do |train_id, train|
        if type.nil? 
          train_id
  		  elsif( train.type == type)
  			  no_trains = false
          train_id if train.type == type
  		  end
      end
    end
  end
  
  def train_departure( train )
    self.trains_list.delete(train.number)
  end

  def has_train?( train_id )
    if trains_list[train_id]
      true
    else
      false
    end
  end
	
  def accept_train( train )
    unless self.trains_list[train.number]
      self.trains_list[train.number] = train
    else
      self.trains_list[train.number]
		end
  end
  
  def valid?
    validate!
  rescue
    false
  end
	
  private
  attr_writer :number
  
  protected
  def validate!
    raise "Название не должно быть Nil" if name.nil?
    true
  end
end