require 'test/unit'
extend Test::Unit::Assertions

require './day3.rb'

assert !is_valid_triangle('5 10 25')
assert is_valid_triangle('5 10 14')
