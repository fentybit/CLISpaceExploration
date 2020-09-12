class SpaceExploration::CLI 

    def mission 
        puts ""
        puts "---------  Welcome to the International Space Station!  ----------".colorize(:blue)
        puts "      .    _     *       \|/   .       .      -*-              +  ".colorize(:light_blue)
        puts "        .' \\ `.     +    -*-     *   .         '       .   *     ".colorize(:light_blue)
        puts "     .  |__''_|  .       /|\ +         .    +       .           | ".colorize(:light_blue)
        puts "        |     | .                                        .     -*-".colorize(:light_blue)
        puts "        |     |           `  .    '             . *   .    +    ' ".colorize(:light_blue)
        puts "      _.'-----'-._     *                  .                       ".colorize(:light_blue)
        puts "    /             \__.__.--._______________                       ".colorize(:light_blue)
        puts "------------------------------------------------------------------".colorize(:blue)
        puts ""
        get_astronaut 
        ready_for_mission? 
    end 

    def get_astronaut 
        puts "Good day, Astronaut! What's your name?"
        name = gets.strip.split[0].capitalize

        puts ""
        puts "How many years of travel space experience do you have?"
        yrs_exp = gets.strip 

        Astronaut.new(name, yrs_exp)
        
        puts ""
        puts "Hello #{name}. Would you like to add another astronaut for your crew? Y/N."
        input = gets.strip

        puts ""
        if input.downcase == "y" || input.downcase == "yes"
            Astronaut.new 
            puts "Smart decision." 
            puts "Shelby Hall has been traveling in space with 27 years of experience, and she will be your travel buddy."
            puts "Let's now select your spacecraft, powered by SpaceX."
        else
            puts "You are very brave, #{name}."
            puts "Let's now select your spacecraft, powered by SpaceX."
        end 
    end 

    def ready_for_mission?
        puts "Are you ready for your mission? Y/N."
        input = gets.strip

        puts ""
        if input.downcase == "y" || input.downcase == "yes"
            get_spacecraft
        else 
            puts "Mission Abort!"
            puts "You may restart your mission whenever you are ready."
        end 
    end 

    def get_spacecraft 
        puts ""
        puts "------------------------------------------------------------------".colorize(:blue)
        puts "                                  __                              ".colorize(:blue)
        puts "                                  \ \_____                        ".colorize(:blue)
        puts "                               ###[==_____>                       ".colorize(:blue)
        puts "                                  /_/      __                     ".colorize(:blue)
        puts "                                           \ \_____               ".colorize(:blue)
        puts "                                        ###[==_____>              ".colorize(:blue)
        puts "                                           /_/                    ".colorize(:blue) 
        puts "------------------------------------------------------------------".colorize(:blue)
        puts ""
        puts "We have 4 available spacecrafts:"
        API.spacecraft_selections 
        puts "Which one would you like to choose? Enter 1, 2, 3 or 4."
        input = gets.strip
        name = API.spacecraft_data[input.to_i - 1]["rocket_name"]
        Spacecraft.new(name)
        puts "Great! #{name} is up and ready for you."
        choose_planet
    end 

    def choose_planet 
        puts ""
        puts "There are many to choose in this Milky Way Galaxy."
        puts "1. Planets"
        puts "   Astronomical body orbiting a star or stellar remnant that is massive enough to be rounded by its own gravity"
        puts "2. Dwarf Planets"
        puts "   Worlds that are too small to be considered full-fledged planets, but too large to fall into smaller categories."
        puts "3. Your spacecraft can select random planet to fit best the fuel and time travel efficiency."
        puts "Would you like to travel to Planets or Dwarf Planets? Enter 1, 2 or 3."
        user_choose_planet
    end 

    def user_choose_planet
        input = gets.strip
        
        if input == "1"
            API.planets.each.with_index(1) {|x, i| puts "#{i}. #{x}"}
            puts "Which one would you like to go to?"
        elsif input == "2"
            API.dwarf_planets.each.with_index(1) {|x, i| puts "#{i}. #{x}"}
            puts "Which one would you like to go to?"
        elsif input == "3"
            API.random_planet
            puts "Great! We shall prepare immediately."
        else 
            puts "Please re-enter option 1, 2 or 3."
            user_choose_planet 
        end 

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

        # puts " .              +   .                .   . .     .  ."
        # puts "        .                    .       .     * "
        # puts ".       *                        . . . .  .   .  + ."
        # puts "                           .   .  +  . . ."
        # puts ".                 |             .  .   .    .    . ."
        # puts "       |           .     .     . +.    +  ."
        # puts "      \|/            .       .   . ."
        # puts ". .       V          .    * . . .  .  +   ."
        # puts "+      .           .   .      +"
        # puts "                 .       . +  .+. ."
        # puts ".                      .     . + .  . .     .      ."
        # puts ".      .    .     . .   . . .        ! /"
        # puts "*             .    . .  +    .  .       - O -"
        # puts ".     .    .  +   . .  *  .       . / |"
        # puts "    . + .  .  .  .. +  ."
        # puts ".      .  .  .  *   .  *  . +..  .            *"
        # puts ".      .   . .   .   .   . .  +   .    .            +"