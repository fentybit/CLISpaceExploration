# Planet belongs to Spacecraft
# Planet has many Astronauts through Spacecraft

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

    # def save 
    #     self.class.all << self
    # end 

    # def self.count 
    #     all.count 
    # end 

end 