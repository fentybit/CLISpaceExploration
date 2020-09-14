class Spacecraft 
    extend Paramable::ClassMethods
    include Paramable::InstanceMethods

    attr_accessor :name, :astronaut, :planet 
    @@all = []

    def initialize(name)
        @name = name 
        save 
    end 

    def self.all 
        @@all
    end 

    def planets_by_spacecraft(rocket)
        Planet.all.select do |each_planet| 
            if each_planet.spacecraft == rocket
                puts each_planet.name
            end 
        end 
    end 

    def self.list_planets_by_spacecraft
        all.each.with_index(1) do |rocket, i| 
            puts "Spacecraft #{i} - #{rocket.name}"
            puts "Planets visited:" 
            puts rocket.planets_by_spacecraft(rocket.name)
            puts ""
        end 
    end 
end 