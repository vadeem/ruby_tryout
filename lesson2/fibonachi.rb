#первые два элемента
fibonachi = [0,1]

#выводим 100 элементов ) хотя допускаю что я неправильно понял задание
while( fibonachi.length <= 100)
 fibonachi << ( fibonachi[-1] + fibonachi[-2] )
end

puts fibonachi