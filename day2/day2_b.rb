#     1
#   2 3 4
# 5 6 7 8 9
#   A B C
#     D

#      1
#    2 3  4
# 5  6 7  8  9
#   10 11 12
#      13


module Mappings
  def Mappings.U(int)
    return 1 if int == 3
    return 9 if int == 9
    return 11 if int == 13
    int - 4 < 2 ? int : int - 4
  end

  def Mappings.D(int)
    return 3 if int == 1
    return 5 if int == 5
    return 13 if int == 11
    int + 4 > 12 ? int : int + 4
  end

  def Mappings.L(int)
    return int if [1, 5, 13].include? int
    return 5 if int == 6
    (int - 2) % 4 == 0 ? int : int - 1
  end

  def Mappings.R(int)
    return int if [1, 9, 13].include? int
    return 9 if int == 8
    int % 4 == 0 ? int : int + 1
  end

end

def hex_move(input)
  lines = input.split("\n").map(&:strip).reject(&:empty?)

  starting_num = 5
  lines.map { |line|
    starting_num = line.chars.reduce(starting_num) { |num, direction| Mappings.send(direction, num) }
  }.map{|int| int.to_s(16).upcase}.join('')
end

if __FILE__ == $0 || __FILE__ == '(pry)'
  input = File.read('input.txt')
  puts hex_move(input)
end
