
# 1 2 3
# 4 5 6
# 7 8 9

module Mappings
  def Mappings.U(int)
    int - 3 < 1 ? int : int - 3
  end

  def Mappings.D(int)
    int + 3 > 9 ? int : int + 3
  end

  def Mappings.L(int)
    (int - 1) % 3 == 0 ? int : int - 1
  end

  def Mappings.R(int)
    int % 3 == 0 ? int : int + 1
  end
end

def move(input)
  lines = input.split("\n").map(&:strip).reject(&:empty?)

  starting_num = 5
  lines.map { |line|
    starting_num = line.chars.reduce(starting_num) { |num, direction| Mappings.send(direction, num) }
  }.join('')
end

if __FILE__ == $0 || __FILE__ == '(pry)'
  input = File.read('input.txt')
  puts move(input)
end
