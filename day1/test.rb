require 'test/unit'
extend Test::Unit::Assertions

require './day1.rb'
require './day1_b.rb'

assert distance('R2, L3') == 5
assert distance('R2, R2, R2') == 2
assert distance('R5, L5, R5, R3') == 12

assert first_duplicate_visit_distance('R8, R4, R4, R8') == 4
