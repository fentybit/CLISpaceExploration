class Planet
    extend Paramable::ClassMethods
    include Paramable::InstanceMethods

    attr_accessor :name, :spacecraft
    @@all = []

    def initialize(name, spacecraft)
        @name = name 
        @spacecraft = spacecraft
        save
    end 

    def self.all 
        @@all 
    end 
end 