require 'pry'

class API 

    # API for spacecraft data
    
    def self.spacecraft_data
        url = "https://api.spacexdata.com/v3/rockets"
        uri = URI.parse(url)
        response = Net::HTTP.get_response(uri)
        response.body

        JSON.parse(response.body)
    end

    def self.spacecraft_selections 
        spacecraft_data.each do |ship|
            puts ship["rocket_name"].to_s 
            puts ship["description"].to_s
            puts "  Height: " + ship["height"]["feet"].to_s + " feet"
            puts "  Mass: " + ship["mass"]["lb"].to_s + " lbs"
        end 
    end 

    def self.spacecraft_status(name)
        spacecraft_data.detect do |ship|
            if ship["rocket_name"] == name 
                puts ship["rocket_name"].to_s 
                puts "  Success Rate: " + ship["success_rate_pct"].to_s + "%"
                puts "  Engine type: " + ship["engines"]["type"].capitalize.to_s 
                puts "  Engine propellant 1: " + ship["engines"]["propellant_1"].capitalize.to_s 
                puts "  Engine propellant 2: " + ship["engines"]["propellant_2"].capitalize.to_s 
            end 
        end 
    end 
    
    # API for planet data

    def self.space_data
        url = "https://api.le-systeme-solaire.net/rest/bodies/"
        uri = URI.parse(url)
        response = Net::HTTP.get_response(uri)
        response.body
                
        JSON.parse(response.body)["bodies"]
    end 

    def self.planets
        planets = []

        space_data.each do |data|
            if data["isPlanet"] == true
                planets << data["englishName"]
            end 
        end 

        planets 
    end 

    def self.dwarf_planets
        dwarf_planets = []

        space_data.each do |data|
            if data["isPlanet"] == false && data["englishName"] != ""
                dwarf_planets << data["englishName"]
            end 
        end 
    
        dwarf_planets.sample(10)
    end 

    def self.random_planet
        random_planet = []

        space_data.each do |data|
            random_planet << data["englishName"]
        end 

        random_planet.sample(1)
    end 
    
    def self.planet_info(name)
        space_data.detect do |data|
            if data["englishName"] == name 
                puts "Name: " + data["englishName"].to_s
                puts "  Mean Radius: " + data["meanRadius"].to_s + " kilometres"
                puts "  Density: " + data["density"].to_s + " g.cm3"
                puts "  Gravity: " + data["gravity"].to_s + " m.s-2"
                puts "  Perihelion: " + data["perihelion"].to_s + " kilometres"
                puts "  Aphelion: " + data["aphelion"].to_s + " kilometres"
                if data["discoveredBy"] != ""
                    puts "  Discovered by: " + data["discoveredBy"].to_s
                end 
                if data["discoveryDate"] != ""
                    puts "  Discovery Date: " + data["discoveryDate"].to_s
                end 
            end 
        end 
    end 

    def self.planet_name(id_name)
        space_data.detect do |data|
            if data["id"] == id_name 
                return data["englishName"]
            end 
        end 
    end 

    def self.planet_gravity(name)
        space_data.detect do |data| 
            if data["englishName"] == name 
                return data["gravity"]
            end 
        end 
    end 
end 