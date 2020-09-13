require 'pry'
# Add spacecraft condition

class Spacecraft 
    attr_accessor :name, :astronaut, :planet 
    @@all = []

    def initialize(name)
        @name = name 
        save 
    end 

    def self.all 
        @@all 
    end 

    def save
        self.class.all << self
    end 

    def planets_by_spacecraft(rocket)
        Planet.all.select do |each_planet| 
            if each_planet.spacecraft == rocket
                puts each_planet.name
            end 
        end 
    end 
    
end 