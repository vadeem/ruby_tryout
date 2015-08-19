#Заполнить массив числами от 10 до 100 с шагом 5

i       = 10;
numbers = []

until( i > 100)
  numbers.push(i)
  i += 5;
end

puts numbers
puts numbers.class