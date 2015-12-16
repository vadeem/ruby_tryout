puts 'Enter triangle A side'
a = gets.chomp.to_i

puts 'Enter triangle B side'
b = gets.chomp.to_i

puts 'Enter triangle C side'
c = gets.chomp.to_i

#array of items
triangle_sides = [a,b,c]

#biggest value is a hypotenuse
hypotenuse = triangle_sides.max

#other sides is cathetuses
cathetus_array = triangle_sides - [ hypotenuse ];

#calculate summ of exp of cathetus
cathetus_sum = 0
cathetus_array.each do |cathetus|
  cathetus_sum += cathetus**2
end

#check is it right triangle
if ( hypotenuse**2 == cathetus_sum )
  puts "It's a right triangle"
else
  puts "It's not a right triangle"
end

#check is it equilateral or is it isosceles triangle
if (a == b  && b == c && c == a)
  puts "it's an equilateral triangle"
elsif ( a == b ) || ( b == c ) || ( c == a )
  puts "it's an isosceles triangle"
else
  puts "it's not an isosceles or equilateral triangle"
end