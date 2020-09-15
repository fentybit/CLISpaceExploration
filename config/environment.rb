require 'bundler/setup'
Bundler.require

require 'open-uri'
require 'net/http'
require 'colorize'
require 'lolize'

require_relative "../lib/paramable"
require_all './lib'

# require_relative "../lib/space_exploration/cli"
# require_relative "../lib/space_exploration/version"
# require_relative "../lib/api"
# require_relative "../lib/astronaut"
# require_relative "../lib/planet"
# require_relative "../lib/spacecraft"