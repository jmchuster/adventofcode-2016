require 'test/unit'
extend Test::Unit::Assertions

require './day1.rb'

assert distance('R2, L3') == 5
assert distance('R2, R2, R2') == 2
assert distance('R5, L5, R5, R3') == 12

puts 'OK'
