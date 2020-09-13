class Astronaut
    extend Paramable::ClassMethods
    include Paramable::InstanceMethods
    attr_reader :name, :yrs_exp
    # Once you pick the assigned astronauts, you can not change once mission commences
    @@all = []
    
    def initialize(name = "Shelby", yrs_exp = 27)
        @name = name
        @yrs_exp = yrs_exp 
        save 
    end 

    def self.all
        @@all
    end 

    # def save
    #     self.class.all << self
    # end 

    # def self.count 
    #     all.count 
    # end 

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
end 