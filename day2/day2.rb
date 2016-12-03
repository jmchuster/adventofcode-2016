
# 1 2 3
# 4 5 6
# 7 8 9

def U(int)
  int - 3 < 1 ? int : int - 3
end

def D(int)
  int + 3 > 9 ? int : int + 3
end

def L(int)
  (int - 1) % 3 == 0 ? int : int - 1
end

def R(int)
  int % 3 == 0 ? int : int + 1
end

def move(input)
  current_start = 5
  instrs = input.split("\n").map(&:strip).reject(&:empty?)
  instrs.map { |instr|
    current_start = instr.chars.reduce(current_start) {|memo, obj|
      case obj
        when 'U' then U(memo)
        when 'D' then D(memo)
        when 'L' then L(memo)
        when 'R' then R(memo)
      end
    }
  }.join('')
end

if __FILE__ == $0 || __FILE__ == '(pry)'
  input = File.read('input.txt')
  puts move(input)
end
