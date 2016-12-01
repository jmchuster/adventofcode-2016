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
    distance = instruction[1..-1]

    orientation = case turn
      when 'L' then (orientation - 1 + 4) % 4
      when 'R' then (orientation + 1 + 4) % 4
    end

    case orientation
      when N then y_distance += distance.to_i
      when E then x_distance += distance.to_i
      when S then y_distance -= distance.to_i
      when W then x_distance -= distance.to_i
    end
  end

  return x_distance.abs + y_distance.abs
end

if __FILE__ == $0
  input = File.read(ARGV[0])
  inputs = input.split("\n").map(&:strip).reject(&:empty?)
  inputs.map{|input| puts distance(input) }
end
