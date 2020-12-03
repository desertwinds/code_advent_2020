def calculate_trees_for_slopes(x, y)
  positionX = 0
  positionY = 0
  trees = 0

  map = File.read("input.txt").split

  while positionY < map.size do
    map_line = map[positionY]
    if map[positionY][positionX] == '#'
      trees += 1
    end
    positionX = (positionX + x) % map[positionY].length
    positionY += y
  end

  trees
end

continue = true
total_trees = []

while continue do
  puts "Enter your slope distance in X"
  x = gets.chomp.to_i
  puts "Enter your slop distance in Y"
  y = gets.chomp.to_i

  trees_for_this_run = calculate_trees_for_slopes(x, y)
  puts "For slope #{x}, #{y} we found: #{trees_for_this_run}"
  total_trees.push(trees_for_this_run)

  puts "Do you want to continue? Press 1"
  continue = gets.chomp.to_i == 1
end

multiplied_trees = total_trees.reduce(1){|acc, trees| acc * trees}
puts "In total we had these trees #{total_trees}"
puts "Your answer will be #{multiplied_trees}"
