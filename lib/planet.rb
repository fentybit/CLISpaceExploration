# Planet belongs to Spacecraft
# Planet has many Astronauts through Spacecraft

class Planet
    attr_accessor :name, :spacecraft
    @@all = []

    def initialize(name)
        @name = name 
        save
    end 
    
    # def initialize(neso)
    #     attributes = Scraper.planet_attributes(name)
    #     neso.each {|key, value| self.send(("#{key}="), value)}
    # end 

    def self.all 
        @@all 
    end 

    def save 
        self.class.all << self
    end 

end 