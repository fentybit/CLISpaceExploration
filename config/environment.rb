require 'bundler/setup'
Bundler.require

require 'open-uri'
require 'net/http'
require 'colorize'
# require_all '../lib'

require_relative "../lib/space_exploration/version"
require_relative "../lib/space_exploration/cli"
require_relative "../lib/astronaut"
require_relative "../lib/api"
require_relative "../lib/spacecraft"
require_relative "../lib/planet"

module SpaceExploration
  class Error < StandardError; end
  # Your code goes here...
end