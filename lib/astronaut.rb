class Astronaut
    extend Paramable::ClassMethods
    include Paramable::InstanceMethods

    attr_accessor :name, :yrs_exp, :spacecraft
    @@all = []
    
    def initialize(name = "Shelby", yrs_exp = 27)
        @name = name
        @yrs_exp = yrs_exp 
        save 
    end 

    def self.all
        @@all
    end 

    def self.avg_yrs_exp
        total_yrs_exp = all.collect {|astro| astro.yrs_exp}.sum
        (total_yrs_exp.to_f)/all.count
    end 

    def self.sorted_names
        array = all.map do |astro|
            astro.name
        end 
        array.sort
    end 

    # list planets per individual astronaut? 
    # need to re-factor the CLI class

    # def planets_by_astronaut(astro_name)
    #     Spacecraft.all.select do |rocket| 
    #         if rocket.astronaut == astro_name 
    #             puts rocket.planet
    #         end 
    #     end  
    # end 
    
    # def self.list_planets_by_astronaut 
    #     self.all.each.with_index(1) do |astro, i| 
    #         puts "Astronaut #{i} - #{astro.name}"
    #         puts "Planets visited:"
    #         puts astro.planets_by_astronaut(astro.name) 
    #         puts ""
    #     end 
    # end 
end 