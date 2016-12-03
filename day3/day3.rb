
def is_valid_triangle(line)
  sides = line.split.map(&:to_i).sort
  # A B C
  # if we sort in order need to guarantee
  # A + B > C must check
  # A + C > B must follow from above, since we made B bigger and C smaller
  # B + C > A already known
  sides[0] + sides[1] > sides[2]
end

if __FILE__ == $0 || __FILE__ == '(pry)'
  input = File.read('input.txt')
  inputs = input.split("\n").map(&:strip).reject(&:empty?)
  puts inputs.select{ |line| is_valid_triangle(line) }.count
end
