puts 'if any of coefficient is negative use minus "-" before its value'
print 'enter A from ax**2: '
a = gets.to_i

print 'enter B from bx: '
b = gets.to_i

print 'enter C: '
c = gets.to_i

discriminant = b**2 - 4*a*c
puts "Discriminant #{discriminant}"

#cases of discriminant and result roots of function
if ( discriminant < 0)
  puts 'no roots'
elsif( discriminant == 0)
 puts "root is #{ -b / 2*a }"
else
  #saving square root of discriminant in same variable to avoid duplicate operations in roots calculations
  discriminant = Math.sqrt(discriminant)
  #base for root calc to avoid duplicate operations in roots calculations
  base = 2*a
  
  puts "first root is #{ (-b + discriminant ) / base }"
  puts "second root is #{ ( -b - discriminant) / base }"
end