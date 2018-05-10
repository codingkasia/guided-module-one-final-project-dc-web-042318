require_relative '../config/environment.rb'
require 'pry'


new_cli = CommandLineInterface.new
new_cli.run


binding.pry
puts "done"
