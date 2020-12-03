require "csv"

input = CSV.read("input.txt", converters: :numeric).flatten
solved1 = false
solved2 = false

input.each_with_index do |tail, tail_index|
  ((tail_index + 1)..(input.length - 1)).each do |head_index|
    head = input[head_index]
    if head + tail == 2020
      solved1 = true
      puts "part 1 numbers: #{head}, #{tail}"
      puts "part 1 answer: #{head * tail}"
      return if solved2
    end
    if head + tail < 2020
      ((head_index + 1)..(input.length - 1)).each do |middle_index|
        middle = input[middle_index]
        if head + middle + tail == 2020
          solved2 = true
          puts "part 2 numbers: #{head}, #{middle}, #{tail}"
          puts "part 2 answer: #{head * middle * tail}"
          return if solved1
        end
      end
    end
  end
end
