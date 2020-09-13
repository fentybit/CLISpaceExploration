class SpaceExploration::CLI 

    def start 
        puts ""
        colorizer = Lolize::Colorizer.new
        colorizer.write " ---------  Welcome to the International Space Station!  ----------- \n"
        colorizer.write "        .    _     *       \|/   .       .      -*-              +   \n"
        colorizer.write "          .' \\ `.     +    -*-     *   .         '       .   *      \n"
        colorizer.write "       .  |__''_|  .       /|\ +         .    +       .           |  \n"
        colorizer.write "          |     | .                                        .     -*- \n"
        colorizer.write "          |     |           `  .    '             . *   .    +    '  \n"
        colorizer.write "        _.'-----'-._     *                  .                        \n"
        colorizer.write "      /             \__.__.--._______________                        \n"
        colorizer.write " ------------------------------------------------------------------- \n"
        puts ""
        get_astronaut 
        ready_for_mission? 
    end 

    def get_astronaut 
        puts "Good day, Astronaut! What's your name?"
        name = gets.strip.split[0].capitalize

        puts ""
        puts "How many years of travel space experience do you have?"
        yrs_exp = gets.strip.to_i

        Astronaut.new(name, yrs_exp)
        
        puts ""
        puts "Hello #{name}. Would you like to add another astronaut for your crew? Y/N."
        input = gets.strip

        puts ""
        if input.downcase == "y" || input.downcase == "yes"
            Astronaut.new 
            puts "Smart decision." 
            puts "Shelby Hall has been traveling in space with 27 years of experience, and she will be your travel buddy."
            puts "The space crew has an average of #{Astronaut.avg_yrs_exp} years of space traveling experience."
            puts ""
            puts "Let's now select your spacecraft, powered by SpaceX."
        else
            puts "You are very brave, #{name}."
            puts ""
            puts "Let's now select your spacecraft, powered by SpaceX."
        end 
    end 

    def ready_for_mission?
        puts "Are you ready for your mission? Y/N."
        input = gets.strip

        if input.downcase == "y" || input.downcase == "yes"
            get_spacecraft
        else 
            puts ""
            puts "Mission Abort!"
            puts "You may restart your mission whenever you are ready."
        end 
    end 

    def get_spacecraft 
        puts ""
        puts "We have 4 available spacecrafts:"
        puts ""
        API.spacecraft_selections 
        puts "Which one would you like to choose? Enter 1, 2, 3 or 4."
        input = gets.strip

        @rocket_name = API.spacecraft_data[input.to_i - 1]["rocket_name"]
        Spacecraft.new(@rocket_name)
        puts ""
        puts "Great! #{@rocket_name} is up and ready for you."
        puts ""
        puts "There are many to choose in this Milky Way Galaxy."
        choose_planet
    end 

    def choose_planet 
        puts ""
        puts "1. Planets"
        puts "   Astronomical body orbiting a star or stellar remnant that is massive enough to be rounded by its own gravity"
        puts "2. Dwarf Planets"
        puts "   Worlds that are too small to be considered full-fledged planets, but too large to fall into smaller categories."
        puts "3. Your spacecraft can select random planet to fit best the fuel and time travel efficiency."
        puts ""
        puts "Would you like to travel to Planets or Dwarf Planets? Enter 1, 2 or 3."

        user_choose_planet
    end 

    def user_choose_planet
        input_one = gets.strip
        
        if input_one == "1"
            puts ""
            puts "Here are your Planet selections."
            planets = API.planets.each.with_index(1) {|x, i| puts "#{i}. #{x}"}
            puts "Which one would you like to go to? Enter the number."
            input_two = gets.strip.to_i
            @current_planet = planets[input_two - 1].to_s
            Planet.new(@current_planet, @rocket_name)
        elsif input_one == "2"
            puts ""
            puts "There are 273 Dwarf Planet selections. We will give you 10."
            planets = API.dwarf_planets.each.with_index(1) {|x, i| puts "#{i}. #{x}"}
            puts "Which one would you like to go to? Enter the number."
            input_two = gets.strip.to_i
            @current_planet = planets[input_two - 1].to_s
            Planet.new(@current_planet, @rocket_name)
        elsif input_one == "3"
            @current_planet = API.random_planet.first
            puts "Great! We shall prepare immediately."
            Planet.new(@current_planet, @rocket_name)
        else 
            puts "Please re-enter option 1, 2 or 3."
            user_choose_planet 
        end 

        puts "#{@current_planet} it is. Please stand by."
        
        planet_landing?
    end 

    def planet_landing?
        puts ""
        puts "Welcome to #{@current_planet}. Loading planet information."
        puts ""
        API.planet_info(@current_planet)
        puts ""

        gravity = API.planet_gravity(@current_planet)

        if gravity == 0.0 || gravity == nil 
            puts "Unfortunately, we are unable to land on this planet with 0 gravity.".colorize(:red)
        else 
            puts "We are able to land on this planet with #{gravity} m.s-2 gravity.".colorize(:green)
        end 
        
        more_space_travel
    end 

    def more_space_travel 
        puts ""
        puts "Would you like to travel to other planets? Y/N."
        input_one = gets.strip

        if input_one.downcase == "y" || input_one.downcase == "yes"
            puts ""
            puts "Let's check your current spacecraft #{@rocket_name} engine status."
            puts ""
            API.spacecraft_status(@rocket_name)
            puts ""
            puts "Would you like to change your spacecraft? Y/N."
            input_two = gets.strip

            if input_two.downcase == "y" || input_two.downcase == "yes" 
                welcome_back_to_iss
                get_spacecraft
            elsif input_two.downcase == "n" || input_two.downcase == "no" 
                closest_planet(@current_planet)
            end 

        elsif input_one.downcase == "n" || input_one.downcase == "no"
            return_to_iss
        end 
    end 

    def welcome_back_to_iss 
        puts ""
        puts "-------  Welcome back to the International Space Station!  -------".colorize(:blue)
        puts "      .    _     *       \|/   .       .      -*-              +  ".colorize(:light_blue)
        puts "        .' \\ `.     +    -*-     *   .         '       .   *     ".colorize(:light_blue)
        puts "     .  |__''_|  .       /|\ +         .    +       .           | ".colorize(:light_blue)
        puts "        |     | .                                        .     -*-".colorize(:light_blue)
        puts "        |     |           `  .    '             . *   .    +    ' ".colorize(:light_blue)
        puts "      _.'-----'-._     *                  .                       ".colorize(:light_blue)
        puts "    /             \__.__.--._______________                       ".colorize(:light_blue)
        puts "------------------------------------------------------------------".colorize(:blue)
        puts ""
    end 

    def closest_planet(current_planet)
        API.space_data.detect do |data|
            if data["englishName"] == current_planet 
                if data["aroundPlanet"] == nil
                    puts ""
                    puts "There is no nearby planets."
                    puts "#{@rocket_name} is re-calibrating the Milky Way Solar System."
                    choose_planet
                elsif data["aroundPlanet"]["planet"] != nil 
                    colorizer = Lolize::Colorizer.new
                    colorizer.write " .              +   .                .   . .     .  .\n"
                    colorizer.write "        .                    .       .     *         \n"
                    colorizer.write ".       *                        . . . .  .   .  + . \n"
                    colorizer.write "                           .   .  +  . . .           \n"
                    colorizer.write "+      .           .   .      +                      \n"
                    colorizer.write "                 .       . +  .+. .                  \n"
                    colorizer.write ".                      .     . + .  . .     .      . \n"
                    colorizer.write "    . + .  .  .  .. +  .                             \n"
                    colorizer.write ".      .  .  .  *   .  *  . +..  .            *      \n"
                    colorizer.write ".      .   . .   .   .   . .  +   .    .            +\n"
                    puts ""
                    puts "Your closest planet is " + data["englishName"].to_s + "."
                    puts ""
                    puts "Would you like to go there? Y/N."
                    input_one = gets.strip

                    if input_one.downcase == "y" || input_one.downcase == "yes"
                        id_name = data["englishName"]
                        @current_planet = API.planet_name(id_name)
                        
                        Planet.new(@current_planet, @rocket_name)
                        planet_landing?
                    else 
                        choose_planet 
                    end       
                end 
            end 
        end 
    end 

    def return_to_iss
        welcome_back_to_iss
        puts "Here is summary of your space travel."
        puts ""
        puts "Your space crew:"
        Astronaut.sorted_names.each_with_index {|x, i| puts "#{i + 1}. #{x}"}
        puts ""

        Spacecraft.all.each.with_index(1) do |rocket, i| 
            puts "Spacecraft #{i}: #{rocket.name}"
            puts "Planets conquered:" 
            puts ship.planets_by_spacecraft(rocket.name)
            puts ""
        end 
        puts ""
        puts "Goodbye now."
    end 
    
end 
        
# input = nil
# while input != "exit" 
# puts "blablabla"
# case
# when
# else (when user input wrong)

# ||=
# private methods?

# Custom Error

