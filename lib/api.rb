class API 

    # API for spacecraft data
    
    def self.spacecraft_data
        url = "https://api.spacexdata.com/v3/rockets"
        uri = URI.parse(url)
        response = Net::HTTP.get_response(uri)
        response.body

        JSON.parse(response.body)[0..2]
    end

    def self.spacecraft_selection
        spacecraft_data.collect.with_index(1) do |rocket, i|
                puts ""
                puts "Spacecraft #{i} - ".colorize(:light_cyan) + rocket["rocket_name"].to_s.colorize(:light_cyan)
                puts rocket["description"].to_s
                puts "  Height: " + rocket["height"]["feet"].to_s + " feet"
                puts "  Mass: " + rocket["mass"]["lb"].to_s + " lbs"
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

        space_data.collect do |data|
            if data["isPlanet"] == true
                planets << data["englishName"]
            end 
        end 

        planets 
    end 

    def self.dwarf_planets
        dwarf_planets = []

        space_data.collect do |data|
            if data["isPlanet"] == false && data["englishName"] != ""
                dwarf_planets << data["englishName"]
            end 
        end 
    
        dwarf_planets.sample(10)
    end 

    def self.random_planet
        random_planet = []

        space_data.collect do |data|
            if data["englishName"] != ""
                random_planet << data["englishName"]
            end 
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

    def self.planet_name_search(id_name)
        space_data.detect do |data|
            if data["id"] == id_name.downcase 
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