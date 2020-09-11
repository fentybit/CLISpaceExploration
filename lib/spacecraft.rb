require 'pry'
# Spacecraft belongs to Austronaut
# Spacecraft lands on many Planets

# Add spacecraft condition

class Spacecraft 
    attr_accessor :name, :astronaut, :planet 
    @@all = []

    def initialize(name)
        @name = name 
        @@all << self 
    end 

    def self.all 
        @@all 
    end 

    def planets 
        Planet.all.select {|each_planet| each_planet.spacecraft == self}
    end 

    def status 
        Scraper.spacecraft_status(name)
    end 

   
         
end 