puts "Enter your slope distance in X"
x = gets.chomp.to_i
puts "Enter your slop distance in Y"
y = gets.chomp.to_i

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

puts "We found this many trees: #{trees}"
