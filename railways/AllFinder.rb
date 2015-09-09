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
  	  self.class.all[obj.object_id] = obj
    end
  end
  
end