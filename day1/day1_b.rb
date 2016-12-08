require 'ostruct'
require 'byebug'

N = 0
E = 1
S = 2
W = 3

def first_duplicate_visit_distance(instructions_string)
  instructions = instructions_string.split(',').map(&:strip).reject(&:empty?)

  x_distance = 0
  y_distance = 0

  segments = []

  orientation = N
  instructions.each do |instruction|
    turn = instruction[0]
    distance = instruction[1..-1].to_i

    orientation = case turn
      when 'L' then (orientation - 1) % 4
      when 'R' then (orientation + 1) % 4
    end

    # save every move as a new segment
    # starting x,y and ending x,y
    # and then each new segment checks for intersections with the previous ones

    new_segment = []
    new_segment <<  OpenStruct.new({x: x_distance, y: y_distance})

    case orientation
      when N then y_distance += distance
      when E then x_distance += distance
      when S then y_distance -= distance
      when W then x_distance -= distance
    end

    new_segment <<  OpenStruct.new({x: x_distance, y: y_distance})

    crossing = crossing_segments(segments[0..-2], new_segment)
    closest = closest_segment(crossing, new_segment, orientation)
    cross = cross_point(closest, new_segment, orientation) if closest
    return (cross.x.abs + cross.y.abs) if cross

    segments << new_segment
  end

  return nil
end

def cross_point(segment, new_segment, orientation)
  OpenStruct.new(
    case orientation
      when N then {x: new_segment[0].x,                                   y: [new_segment[1].y, segment[0].y, segment[1].y].min}
      when E then {x: [new_segment[1].x, segment[0].x, segment[1].x].min, y: new_segment[0].y}
      when S then {x: new_segment[0].x,                                   y: [new_segment[1].y, segment[0].y, segment[1].y].max}
      when W then {x: [new_segment[1].x, segment[0].x, segment[1].x].max, y: new_segment[0].y}
    end
  )
end

def closest_segment(segments, new_segment, orientation)
  case orientation
    when N then segments.sort_by{|seg| [seg[0].y, seg[1].y].min}.first
    when E then segments.sort_by{|seg| [seg[0].x, seg[1].x].min}.first
    when S then segments.sort_by{|seg| [seg[0].y, seg[1].y].max}.last
    when W then segments.sort_by{|seg| [seg[0].x, seg[1].x].max}.last
  end
end

def crossing_segments(segments, new_segment)
  new_segment_xs = [new_segment[0].x, new_segment[1].x]
  new_segment_ys = [new_segment[0].y, new_segment[1].y]

  segments.select do |segment|
    segment_xs = [segment[0].x, segment[1].x]
    segment_ys = [segment[0].y, segment[1].y]
    overlaps(segment_xs, new_segment_xs) and overlaps(segment_ys, new_segment_ys)
  end
end

def overlaps(range_one, range_two)
  sorted_ranges = [range_one.sort, range_two.sort].sort
  sorted_ranges[0][1] >= sorted_ranges[1][0]
end

if __FILE__ == $0 || __FILE__ == '(pry)'
  input = File.read('input.txt')
  inputs = input.split("\n").map(&:strip).reject(&:empty?)
  inputs.map{|input| puts first_duplicate_visit_distance(input) }
end
