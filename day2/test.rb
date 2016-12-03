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
