require 'date'

print "Введите число - день для расчёта порядкового номера дня "
day = gets.chomp.to_i

print "Введите номер месяца для расчёта порядкового номера дня "
month = gets.chomp.to_i

print "Введите год "
year = gets.chomp.to_i

puts Date.new( year, month, day ).yday

