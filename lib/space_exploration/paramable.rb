module Paramable
    module ClassMethods
        # def all
        #     @@all
        # end 

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