# Space Exploration

<div align="center">
  <img src="./space.png">
</div>

<br>

<strong>Domain Modeling >> Space Travel.</strong><br>
Welcome to your Space Exploration, where you can select your space crew, pick your favorite spacecraft (powered by SpaceX), and infinite amount of planets in Milky Way Galaxy to travel to!<br>

<p><a href="https://youtu.be/amt7y-bIKkk">YouTube Demo</a></p>
<p><a href="https://dev.to/codinghall/api-cli-space-exploration-108f">DEV Blog</a></p>

## Installation

```ruby
$ bundle install
$ ./bin/space_exploration
```

## Features

There are 3 main Model or classes:<br>
Astronaut, Spacecraft and Planet

> Astronaut has many Spacecraft <br>
> Astronaut visits many Planets via Spacecraft

> Spacecraft belongs-to Astronaut, or has-many Astronauts <br>
> Spacecraft lands on Planet(s)

> Planet belongs to Spacecraft <br>
> Panet has-many Astronauts via Spacecraft

## Resources

- [x] <a href="https://www.asciiart.eu/">ASCII Art Archive</a>
- [x] <a href="https://api.le-systeme-solaire.net/en/">The Solar System OpenData</a>
