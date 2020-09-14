class SpaceExploration::CLI 

    def start 
        puts ""
        colorizer = Lolize::Colorizer.new
        colorizer.write " ---------  Welcome to the International Space Station!  ----------- \n"
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
        colorizer.write " ------------------------------------------------------------------- \n"
        puts ""
    end 

    def get_astronaut 
        puts "Hello Astronaut! What's your name?"
        @name = gets.strip.split[0].capitalize

        puts ""
        sleep(1)
        puts "How many years of space exploration do you have?"
        yrs_exp = gets.strip.to_i

        Astronaut.new(@name, yrs_exp)
        
        puts ""
        sleep(1)
        puts "Hello #{@name}. Would you like to add another Astronaut to your crew? Y/N."
        
        optional_astronaut?
    end 

    def optional_astronaut?
        input = gets.strip
        
        puts ""
        sleep(1)
        if input.downcase == "y" || input.downcase == "yes"
            Astronaut.new 
            puts "Smart decision." 
            puts ""
            sleep(1)
            puts "Shelby Hall has 27 years of space exploration, and she will be co-captain."
            sleep(1)
            puts "The space crew has an average of #{Astronaut.avg_yrs_exp} years of experience in space."
            puts ""
            sleep(1)
            puts "Let's now select your Spacecraft, powered by SpaceX."
        elsif input.downcase == "n" || input.downcase == "no"
            puts "You are very brave, #{@name}."
            puts ""
            sleep(1)
            puts "Let's now select your Spacecraft, powered by SpaceX."
        else 
            puts ""
            puts "Please re-enter option, Y/N."
            optional_astronaut?
        end 

        puts ""
        sleep(1)
        puts "Are you ready for your mission? Y/N."
        ready_for_mission? 
    end 

    def ready_for_mission?
        input = gets.strip

        sleep(1)
        if input.downcase == "y" || input.downcase == "yes"
            get_spacecraft
        elsif input.downcase == "n" || input.downcase == "no"
            puts ""
            puts "Abort mission!".colorize(:red)
            puts "You may restart your mission when you are ready."
            puts ""
        else 
            puts "Please re-enter option, Y/N."
            ready_for_mission?
        end 
    end 

    def get_spacecraft 
        puts ""
        puts "All Spacecraft are now standing by for departure."
        sleep(1)

        API.spacecraft_selection
        puts ""
        puts "Please make your selection. Enter 1 or 2."
        input = gets.strip

        @rocket_name = API.spacecraft_data[input.to_i - 1]["rocket_name"]
        Spacecraft.new(@rocket_name)
        puts ""
        puts "Great! #{@rocket_name} is primed and ready for launch."
        puts ""
        puts "There are many destinations to select from in the Milky Way Galaxy."
        choose_planet
    end 

    def choose_planet 
        puts ""
        puts "1. Planet"
        puts "   Astronomical body orbiting a star that is massive enough to be rounded by its own gravity."
        puts ""
        puts "2. Dwarf Planet or Asteroid"
        puts "   Worlds that are too small to be considered full-fledged planets, but too large to fall into smaller categories."
        puts ""
        puts "3. Random destination that fits best with fuel and travel time efficiency."
        puts ""
        puts "Please make your selection. Enter 1, 2 or 3."

        user_choose_planet
    end 

    def user_choose_planet
        input_one = gets.strip
        
        if input_one == "1"
            puts ""
            puts "Here are your Planet selections:"
            planets = API.planets.each.with_index(1) {|x, i| puts "#{i}. #{x}"}
            puts ""
            puts "Please make your selection. Enter the number."
            input_two = gets.strip.to_i
            @current_planet = planets[input_two - 1].to_s
            Planet.new(@current_planet, @rocket_name)
        elsif input_one == "2"
            puts ""
            puts "There are 273 Dwarf Planet and Asteroid selections. We will give you 10:"
            planets = API.dwarf_planets.each.with_index(1) {|x, i| puts "#{i}. #{x}"}
            puts ""
            puts "Please make your selection. Enter the number."
            input_two = gets.strip.to_i
            @current_planet = planets[input_two - 1].to_s
            Planet.new(@current_planet, @rocket_name)
        elsif input_one == "3"
            @current_planet = API.random_planet.first 
            puts ""
            puts "Prepare for launch."
            Planet.new(@current_planet, @rocket_name)
        else 
            puts "Please re-enter option 1, 2 or 3."
            user_choose_planet 
        end 

        puts ""
        puts "#{@current_planet} it is. Please stand by."
        
        planet_landing?
    end 

    def planet_landing?
        puts ""
        colorizer = Lolize::Colorizer.new
        colorizer.write "    . .        .  .      /.   .      .    .     .     .  / .      . '\n"
        colorizer.write "        .  +       .    /     .          .          .   /      .     \n"
        colorizer.write "       .            .  /         .            .        *   .         \n"
        colorizer.write "      .   .      .    *     .     .    .      .   .       .  .       \n"
        colorizer.write "          .           .           .           .           .         +\n"
        colorizer.write "  . .        .  .       .   .      .    .     .     .    .      .   .\n"
        colorizer.write " .   +      .          ___/\_._/~~\_...__/\__.._._/~\        .       \n"
        colorizer.write "       .          _.--'                              `--./\          \n"
        colorizer.write "           /~~\/~\                                         `-/~\_    \n"
        puts ""
        puts "Welcome to #{@current_planet}. Loading planet information."
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
        input_one = gets.strip

        if input_one.downcase == "y" || input_one.downcase == "yes"
            puts ""
            puts "Let's check your current Spacecraft #{@rocket_name}'s success rate."
            puts ""
            success_rate = rand(20..90)
            puts ""

            if success_rate < 50  
                puts "Your Spacecraft success rate is currently at #{success_rate}%.".colorize(:red)
                puts "We must first take a detour back to the International Space Station."

                colorizer = Lolize::Colorizer.new
                colorizer.write " ------  Welcome back to the International Space Station!  --------- \n"
                int_space_station

                get_spacecraft
            elsif success_rate >= 50   
                puts "Your Spacecraft success rate is currently at #{success_rate}%.".colorize(:green)
                puts "We may continue the space journey."
                closest_planet(@current_planet)
            end 

        elsif input_one.downcase == "n" || input_one.downcase == "no"
            return_to_int_space_station
        end 
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
                    input_one = gets.strip

                    if input_one.downcase == "y" || input_one.downcase == "yes"
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
        colorizer = Lolize::Colorizer.new
        colorizer.write " ------  Welcome back to the International Space Station!  --------- \n"
        int_space_station
        puts "Here is the summary of your space travel."
        puts ""
        puts "Your space crew:"
        Astronaut.sorted_names.each_with_index {|x, i| puts "#{i + 1}. #{x}"}
        puts ""
        
        Spacecraft.list_planets_by_spacecraft
        puts ""

        puts "You visited #{Planet.count} planets!"
        puts ""
        puts "Goodbye now."
        puts ""
    end 
    
end 
  

# spacecraft performance
# input = nil
# while input != "exit" 
# case
# when
# else (when user input wrong)

# ||=

# Custom Error

