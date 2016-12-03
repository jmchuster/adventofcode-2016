require 'test/unit'
extend Test::Unit::Assertions

require './day3_b.rb'

assert 1 == count_valid_triangles_vertically_grouped(
<<-EOS
5 5
10 10
14 25
EOS
)
