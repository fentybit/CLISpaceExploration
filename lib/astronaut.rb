class Astronaut
    extend Paramable::ClassMethods
    include Paramable::InstanceMethods

    attr_reader :name, :yrs_exp
    attr_accessor :spacecraft
    @@all = []
    
    def initialize(name, yrs_exp)
        @name = name
        @yrs_exp = yrs_exp 
        save 
    end 

    # def name=(name)
    #     @name = name
    # end 

    def self.all
        @@all
    end 

    def self.avg_yrs_exp
        total_yrs_exp = all.collect {|astro| astro.yrs_exp}.sum
        number = (total_yrs_exp.to_f)/all.count
        number.round(2)
    end 

    def self.sorted_names
        array = all.map do |astro|
            astro.name
        end 
        array.sort
    end 
end 