module Paramable
    module ClassMethods
        def count 
            all.count 
        end 
    end 

    module InstanceMethods
        def save
            self.class.all << self
        end 
    end
end