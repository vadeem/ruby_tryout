items_list = {}
total_summ = 0

begin
  print 'Введите название товара '
  item_name = gets.chomp.downcase
  
  #зачем остальное если пользователь ввёл stop
  if( 'stop' != item_name )
    print 'Введите количество заказанного товара ' 
    item_count = gets.chomp.to_f
    
    print 'Введите цену товара '
    price = gets.chomp.to_f
    
    items_list[ item_name ] = { 
      :item_count => item_count, 
      :price      => price 
    }
    
    current_summ = item_count * price;
    total_summ += current_summ
    puts "Позиция #{item_name}, цена (с учётом количества) = #{current_summ}"
    
  end
  
end until ('stop' == item_name || 'стоп' == item_name )

puts "Итого #{total_summ}"

print 'Хэш: '
puts items_list