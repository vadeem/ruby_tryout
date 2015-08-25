require 'date'

days_in_month = [31,28,31,30,31,30,31,31,30,31,30,31] 

print "Введите число - день для расчёта порядкового номера дня "
day = gets.chomp.to_i

print "Введите номер месяца для расчёта порядкового номера дня "
month = gets.chomp.to_i

print "Введите год "
year = gets.chomp.to_i

is_leap_year = false

if( ( 0 == (year % 400) ) || ( 0 == year % 4 && 0 != (year % 100)) )
  is_leap_year = true
end

day_index = 0;

#складываем дни месяцев прошедших до даты
days_in_month.slice(0,month-1).each { |days_in|
  day_index += days_in
}
day_index += day 

if( is_leap_year && month > 2 )
  day_index += 1
end

puts "порядковый номер дня #{day_index}"




#puts Date.new( year, month, day ).yday

