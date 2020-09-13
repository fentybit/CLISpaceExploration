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

    def planets_by_spacecraft
        array = []
        Planet.all.each do |each_planet| 
            if each_planet.spacecraft == self 
                array << each_planet.name
            end 
        end 
        array.sort 
    end 
    
end 