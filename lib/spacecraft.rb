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

    def planets 
        Planet.all.select {|each_planet| each_planet.spacecraft == self}
    end 

    def spacecraft_status(name)
        API.spacecraft.detect do |ship|
            if ship["rocket_name"] == name 
                puts ship["rocket_name"].to_s 
                puts "  Engine type: " + ship["engines"]["type"].capitalize.to_s 
                puts "  Engine propellant 1: " + ship["engines"]["propellant_1"].capitalize.to_s 
                puts "  Engine propellant 2: " + ship["engines"]["propellant_2"].capitalize.to_s 
            end 
        end 
    end 

    def spacecraft_landing(planet)
        API.space_data.detect do |data|
            puts data["gravity"] if data["englishName"] == planet 
        end 
    end 
    
    def status 
        API.spacecraft_status(name)
    end 
    
end 