N = 0
E = 1
S = 2
W = 3

def distance(instructions_string)
  instructions = instructions_string.split(',').map(&:strip).reject(&:empty?)

  x_distance = 0
  y_distance = 0

  orientation = N
  instructions.each do |instruction|
    turn = instruction[0]
    distance = instruction[1..-1].to_i

    orientation = case turn
      when 'L' then (orientation - 1) % 4
      when 'R' then (orientation + 1) % 4
    end

    case orientation
      when N then y_distance += distance
      when E then x_distance += distance
      when S then y_distance -= distance
      when W then x_distance -= distance
    end
  end

  return x_distance.abs + y_distance.abs
end

if __FILE__ == $0 || __FILE__ == '(pry)'
  input = File.read('input.txt')
  inputs = input.split("\n").map(&:strip).reject(&:empty?)
  inputs.map{|input| puts distance(input) }
end
