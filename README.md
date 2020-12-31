# Space Exploration

<div align="center">
  <img src="./space.png">
</div>

<br>

<strong>Domain Modeling >> Space Travel.</strong><br>
Welcome to your Space Exploration, where you can select your space crew, pick your favorite spacecraft (powered by SpaceX), and infinite amount of planets in Milky Way Galaxy to travel to!<br>

<p><a href="https://youtu.be/amt7y-bIKkk">YouTube Demo</a></p>
<p><a href="https://dev.to/codinghall/api-cli-space-exploration-108f">DEV Blog</a></p>

## About 

<p>The journey begins at the International Space Station. The user, an Astronaut, will enter his/her name and years of space traveling experience. The user has an additional option to add another astronaut forming a crew. There will be 3 readily-available Spacecraft selections. They are SpaceX spacecraft, and the data is provided by SpaceX RESTful API. The user will have the option to select Planet, Dwarf Planet or Asteroid as a destination. Individual planetary attributes are limited to our Solar System in the Milky Way galaxy. The spacecraft will not be able to make its landing when the planet's gravity is equivalent to 0.0. The journey does not stop as the astronaut and/or the space crew arrive at their first destination. It will be a continuous loop of traveling options to other destinations, starting with the closest planet based on the user's current position. There are a total of 13 planets, and 273 dwarf planets and/or asteroids. If the spacecraft success rate is less than 50%, the space crew need to re-route back to the International Space Station, and select a different spacecraft. The user will also have another additional option to add another astronaut. Once the user completes his/her space travel, the whole space crew will return to the International Space Station with a summary record of astronauts list involved in this mission, spacecraft selected, and planets visited.</p>

## Features

There are 3 main Model or classes:<br>
Astronaut, Spacecraft and Planet

> Astronaut has many Spacecraft <br>
> Astronaut visits many Planets via Spacecraft

> Spacecraft belongs-to Astronaut, or has-many Astronauts <br>
> Spacecraft lands on Planet(s)

> Planet belongs to Spacecraft <br>
> Panet has-many Astronauts via Spacecraft

## Installation

```ruby
$ bundle install
$ ./bin/space_exploration
```

## Resources

- [x] <a href="https://www.asciiart.eu/">ASCII Art Archive</a>
- [x] <a href="https://api.le-systeme-solaire.net/en/">The Solar System OpenData</a>
