#!/usr/bin/env ruby

require 'bundler/setup'
require './lib/space_exploration'
require_relative 'config/environment.rb'

SpaceExploration::CLI.new