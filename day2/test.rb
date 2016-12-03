require 'test/unit'
extend Test::Unit::Assertions

require './day2.rb'

assert '1985' == move(<<-eos
  ULL
  RRDDD
  LURDL
  UUUUD
eos
)

require './day2_b.rb'

puts result = hex_move(<<-eos
  ULL
  RRDDD
  LURDL
  UUUUD
eos
)
assert result == '5DB3'
