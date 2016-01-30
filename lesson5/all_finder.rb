module AllFinder
  
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods

    attr_accessor :all

    def find(id)
      all[id]
    end
  end

  module InstanceMethods
    def add_one_instance(obj)
      self.class.all ||= {}
  	  self.class.all[obj.number] = obj
    end
    
    def change_number(new_number)
      self.number = new_number.to_i
      self.class.all.delete(self.number)
      self.add_one_instance(self)
    end
    
  end

end