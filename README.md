# Space Exploration

Domain >> Space Travel.
Welcome to your Space Exploration, where you can select your space crew, pick your favorite spacecraft (powered by SpaceX), and infinite amount of planets in Milky Way Galaxy to travel to!

<a href="https://youtu.be/amt7y-bIKkk">YouTube Demo</a>

## Installation

```ruby
$ bundle install
$ ./bin/space_exploration
```

## Features

There are 3 main Model or classes:<br>
Astronaut, Spacecraft and Planet

> Astronaut has many Spacecraft 
> Astronaut visits many Planets via Spacecraft

> Spacecraft belongs-to Astronaut, or has-many Astronauts
> Spacecraft lands on Planet(s)

> Planet belongs to Spacecraft 
> Panet has-many Astronauts via Spacecraft
