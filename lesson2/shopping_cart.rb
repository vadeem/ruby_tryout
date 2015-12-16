items_list = {}
total_summ = 0

loop do
  print 'Введите название товара '
  item_name = gets.chomp.downcase
  
  break if item_name == 'stop'
  
  #зачем остальное если пользователь ввёл stop
  print 'Введите количество заказанного товара ' 
  item_count = gets.chomp.to_f
  
  print 'Введите цену товара '
  price = gets.chomp.to_f
  
  items_list[ item_name ] = { 
    :item_count => item_count, 
    :price      => price 
  }
    
end

total_summ = 0;
items_list.each{| name, params|
  
  current_summ = params[:item_count] * params[:price];
  total_summ += current_summ
  puts "Позиция #{name}, цена (с учётом количества) = #{current_summ}"
  
}

puts "Итого #{total_summ}"

print 'Хэш: '
puts items_list