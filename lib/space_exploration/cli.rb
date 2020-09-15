class SpaceExploration::CLI 

    def start 
        puts ""
        colorizer = Lolize::Colorizer.new
        colorizer.write "----------  Welcome to the International Space Station!  ------------\n"
        int_space_station 

        get_astronaut 
    end 

    def int_space_station 
        colorizer = Lolize::Colorizer.new
        puts ""
        colorizer.write "        .    _     *       \|/   .       .      -*-              +   \n"
        colorizer.write "          .' \\ `.     +    -*-     *   .         '       .   *      \n"
        colorizer.write "       .  |__''_|  .       /|\ +         .    +       .           |  \n"
        colorizer.write "          |     | .                                        .     -*- \n"
        colorizer.write "          |     |           `  .    '             . *   .    +    '  \n"
        colorizer.write "        _.'-----'-._     *                  .                        \n"
        colorizer.write "      /             \__.__.--._______________                        \n"
        colorizer.write "---------------------------------------------------------------------\n"
        puts ""
    end 

    def get_astronaut 
        puts "Hello Astronaut! What's your name?"
        @name = gets.strip.split[0].capitalize

        puts ""
        sleep(1)
        puts "How many years of space exploration do you have?"
        @yrs_exp = gets.strip.to_i

        puts ""
        puts "Hello, #{@name}."
        
        Astronaut.new(@name, @yrs_exp)
        
        get_spacecraft 
    end 

    def get_spacecraft 
        puts ""
        puts "All Spacecraft are now standing by for departure.".colorize(:light_cyan)
        sleep(1)
        puts "Let's now select your Spacecraft, powered by SpaceX.".colorize(:light_cyan)
        sleep(1)

        API.spacecraft_selection
        puts ""
        puts "Please make your selection. Enter 1, 2 or 3."
        rocket_input = gets.strip.to_i

        if rocket_input.between?(1, 3) 
            @rocket_name = API.spacecraft_data[rocket_input.to_i - 1]["rocket_name"]
            Spacecraft.new(@rocket_name)
        else 
            puts "Your input is invalid."
            get_spacecraft 
        end 
        
        puts ""
        puts "Great! #{@rocket_name} is primed and ready for launch."

        optional_astronaut?
    end 

    def optional_astronaut?
        puts ""
        puts "Would you like to add another Astronaut to your crew? Y/N."
        input = gets.strip
        puts ""
        
        sleep(1)
        if input.downcase == "y" || input.downcase == "yes"
            sleep(1)
            puts "Smart decision." 
            puts "What's the Astronaut's name?"
            @name = gets.strip.split[0].capitalize
    
            puts ""
            sleep(1)
            puts "How many years of space exploration does #{@name} have?"
            @yrs_exp = gets.strip.to_i

            Astronaut.new(@name, @yrs_exp)

            sleep(1)
            puts ""
            puts "Your space crew has #{Astronaut.count} Astronauts with an average of #{Astronaut.avg_yrs_exp} years of experience in space."
            sleep(1)
            
        elsif input.downcase == "n" || input.downcase == "no"
            puts "Brave decision."

        else 
            puts "Your input is invalid."
            optional_astronaut?
        end 

        sleep(1)
        puts ""
        puts "Are you ready for your mission? Y/N."

        ready_for_mission? 
    end 

    def ready_for_mission?
        input = gets.strip

        sleep(1)
        if input.downcase == "y" || input.downcase == "yes"
            puts ""
            choose_planet
        elsif input.downcase == "n" || input.downcase == "no"
            puts ""
            puts "Abort mission!".colorize(:red)
            puts "You may restart your mission when you are ready."
            puts ""
        else 
            puts ""
            puts "Please re-enter option, Y/N."
            ready_for_mission?
        end 
    end 

    def choose_planet 
        sleep(1)
        puts "There are many destinations to select from in the Milky Way Galaxy.".colorize(:light_cyan)
        puts ""
        puts "1. Planet".colorize(:light_cyan)
        puts "2. Dwarf Planet or Asteroid".colorize(:light_cyan)
        puts "3. Random selection".colorize(:light_cyan)
        puts ""
        puts "Please make your selection. Enter 1, 2 or 3."

        user_choose_planet
    end 

    def user_choose_planet
        user_input = gets.strip
        
        if user_input == "1"
            puts ""
            puts "Here are your 13 Planet selections:"
            planets = API.planets.each.with_index(1) {|x, i| puts "#{i}. #{x}"}
            puts ""
            puts "Please make your selection. Enter the number."
            planet_input = gets.strip.to_i
          
            if planet_input.between?(1, 13)
                @current_planet = planets[planet_input - 1].to_s
                Planet.new(@current_planet, @rocket_name)
            else 
                puts ""
                puts "Your input is invalid. Please re-enter your selection."
                choose_planet 
            end 

        elsif user_input == "2"
            puts ""
            puts "There are 273 Dwarf Planet and Asteroid selections. We will give you 10:"
            planets = API.dwarf_planets.each.with_index(1) {|x, i| puts "#{i}. #{x}"}
            puts ""
            puts "Please make your selection. Enter the number."
         
            planet_input = gets.strip.to_i
            if planet_input.between?(1, 10)
                @current_planet = planets[planet_input - 1].to_s
                Planet.new(@current_planet, @rocket_name)
            else 
                puts ""
                puts "Your input is invalid. Please re-enter your selection."
                choose_planet 
            end 

        elsif user_input == "3"
            @current_planet = API.random_planet.first 
            Planet.new(@current_planet, @rocket_name)
            puts ""
            puts "Prepare for launch."

        else 
            puts ""
            puts "Please re-enter option 1, 2 or 3."
            user_choose_planet 
        end 

        puts ""
        puts "#{@current_planet} it is. Please stand by."
        
        planet_landing?
    end 

    def planet_landing?
        puts ""
        sleep(1)
        colorizer = Lolize::Colorizer.new
        colorizer.write "        .  +       .    /     .          .          .   /      .     \n"
        colorizer.write "       .            .  /         .            .        *   .         \n"
        colorizer.write "      .   .      .    *     .     .    .      .   .       .  .       \n"
        colorizer.write "          .           .           .           .           .         +\n"
        colorizer.write " .   +      .          ___/\_._/~~\_...__/\__.._._/~\        .       \n"
        colorizer.write "       .          _.--'                              `--./\          \n"
        colorizer.write "           /~~\/~\                                         `-/~\_    \n"
        colorizer.write "---------------------------------------------------------------------\n"
        sleep(1)
        colorizer.write "Welcome to #{@current_planet}! Loading planet information...         \n"

        puts ""
        API.planet_info(@current_planet)
        puts ""

        gravity = API.planet_gravity(@current_planet)

        if gravity == 0.0 || gravity == nil 
            puts "Unfortunately the planet has 0.0 gravity, #{@rocket_name} is unable to make its landing.".colorize(:red)
        else 
            puts "We are able to land on this planet with #{gravity} m.s-2 gravity.".colorize(:green)
        end 
        
        more_space_travel
    end 

    def more_space_travel 
        puts ""
        puts "Would you like to travel to other planets? Y/N."
        user_input = gets.strip

        if user_input.downcase == "y" || user_input.downcase == "yes"
            puts ""
            puts "Let's check your current Spacecraft #{@rocket_name}'s success rate."
            puts ""
        
            success_rate = rand(25..90)

            if success_rate < 50  
                puts "Your Spacecraft success rate is currently at #{success_rate}%.".colorize(:red)
                sleep(1)
                puts ""
                puts "We must first take a detour back to the International Space Station."
                puts ""
                sleep(1)

                colorizer = Lolize::Colorizer.new
                colorizer.write " ------  Welcome back to the International Space Station!  --------- \n"
                int_space_station

                get_spacecraft

            elsif success_rate >= 50   
                puts "Your Spacecraft success rate is currently at #{success_rate}%.".colorize(:green)
                sleep(1)
                puts ""
                puts "We may continue the space journey."
                closest_planet(@current_planet)
            end 

        elsif user_input.downcase == "n" || user_input.downcase == "no"
            return_to_int_space_station

        else 
            puts ""
            puts "Your input is invalid."
            more_space_travel 
        end 
    end 

    def closest_planet(current_planet)
        API.space_data.detect do |data|
            if data["englishName"] == current_planet 
                if data["aroundPlanet"] == nil
                    puts ""
                    puts "There is no nearby planets."
                    sleep(1)
                    puts "#{@rocket_name} is re-calibrating the Milky Way Solar System."
                    puts ""
                    choose_planet
                elsif data["aroundPlanet"]["planet"] != nil 
                    puts ""
                    colorizer = Lolize::Colorizer.new
                    colorizer.write "     .              +   .                    .   . .     .     .     \n"
                    colorizer.write "        .                    .       .     *                         \n"
                    colorizer.write "    .       *                                . . . .      .   .  + . \n"
                    colorizer.write "                               .   .  +  . . .                       \n"
                    colorizer.write "    +      .           .       .      +                              \n"
                    colorizer.write "                      .       . +  .+. .                             \n"
                    colorizer.write "    .                      .     . + .    . .     .      .           \n"
                    colorizer.write "        . + .       .  .    .. +  .                                  \n"
                    colorizer.write "    .      .  .  .  *   .  *  . +..  .            *                  \n"
                    colorizer.write "    .      .   . .        .   .       .   .  +   .    .            + \n"
                    puts ""
                    id_name = data["aroundPlanet"]["planet"]
                    nearby_planet = API.planet_name_search(id_name)
                    puts "The closest planet to your current position in space is #{nearby_planet}."
                    puts ""
                    puts "Would you like to travel there? Y/N."
                    puts ""
                    user_input = gets.strip

                    if user_input.downcase == "y" || user_input.downcase == "yes"
                        @current_planet = nearby_planet
                        
                        Planet.new(@current_planet, @rocket_name)
                        planet_landing?
                    else 
                        choose_planet 
                    end       
                end 
            end 
        end 
    end 

    def return_to_int_space_station 
        puts ""
        colorizer = Lolize::Colorizer.new
        colorizer.write "-------  Welcome back to the International Space Station!  ----------\n"
        int_space_station

        sleep(1)
        puts "Here is the summary of your space travel."
        puts ""
        sleep(1)
        puts "Your space crew:"
        Astronaut.sorted_names.each_with_index {|x, i| puts "#{i + 1}. #{x}"}
        puts ""
        
        sleep(1)
        puts "You visited #{Planet.count} planets!"
        puts ""
        Spacecraft.list_planets_by_spacecraft

        sleep(1)
        puts "Goodbye now."
        puts ""
    end 
    
end 