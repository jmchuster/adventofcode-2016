require './day3.rb'

def count_valid_triangles_vertically_grouped(input)
  # lists of lists of 3
  inputs = input.split("\n").map(&:strip).reject(&:empty?).map(&:split)

  count = 0
  inputs.each_slice(3) { |three_lines|
    (0...three_lines[0].size).each { |index|
      triangle = three_lines.map{ |line| line[index] }.join(' ')
      count += is_valid_triangle(triangle) ? 1 : 0
    }
  }

  count
end

if __FILE__ == $0 || __FILE__ == '(pry)'
  input = File.read('input.txt')
  puts count_valid_triangles_vertically_grouped(input)
end
