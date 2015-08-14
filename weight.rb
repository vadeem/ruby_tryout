#или вопросы по-русски?
print 'What is your name?'
name = gets.chomp.capitalize

print 'What is your height?'
height = gets.chomp.to_i

result = height - 100

if result < 0
  puts "#{name}, your shouldn't eat anymore!"
else  
  puts "#{name}, your ideal weight is #{result}"
end