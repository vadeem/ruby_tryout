require_relative 'train.rb'
require_relative 'all_finder.rb'

class RailwayStation

  include AllFinder
  
  attr_accessor  :name, :trains_list
  attr_reader :number
  
  def initialize( name, number = nil)
    @name = name
    @trains_list = Hash.new(nil)
    if(number.nil?)
      @number = self.object_id;
    else
      @number = number;
    end
    self.add_one_instance(self)
  end
  
  #метод показывает список поездов по типу или (если тип не указать) список всех поездов
  def show_trains( type=nil )
    no_trains = true
    if trains_list.any?
      trains_list.each do |train_id, train|
        if type.nil? 
  		    puts "На станции находится поезд № #{train_id}"
  		  elsif( train.type == type)
  			  no_trains = false
  				puts "На станции находится #{Train::TRAIN_TYPE[train.type]} поезд № #{train_id} " if train.type == type
  		  end
      end
    end
    puts 'no trains at station now' if no_trains && ! type.nil?
  end
  
  def train_departure( train )
    self.trains_list.delete(train.number)
    puts "Поезд №#{train.number} отбыл со станции #{name}"
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
      puts "Поезд №#{train.number} прибыл на станцию #{name}"
    else
      self.trains_list[train.number]
      puts "Поезд №#{train.number} уже находится на станции #{name}"
		end
  end
	
  private
  attr_writer :number
  
end