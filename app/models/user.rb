require 'rest-client'
require 'json'
require 'pry'

file = File.read('/Users/muhidinhukic/Flatiron/code/phase_1_project/data.json')

data_hash = JSON.parse(file)

puts data_hash
