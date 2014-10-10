require 'ostruct'

module Airpic
end

Dir["#{File.dirname(__FILE__)}/**/*.rb"].each { |f| require_relative f }
