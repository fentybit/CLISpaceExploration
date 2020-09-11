# require 'bundler'
# require 'open-uri'
# require 'net/http'
# require 'json'
# Bundler.require
# require_all './lib'

require_relative "../lib/space_exploration/version"
require_relative "../lib/space_exploration/cli"

require 'pry'

module SpaceExploration
  class Error < StandardError; end
  # Your code goes here...
end