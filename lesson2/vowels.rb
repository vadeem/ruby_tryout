letters = ('a'..'z').to_a

result = {}

letters.each{ |letter|
  if( ['a','e','i','o','u'].include? letter )
    result[ letter ] = letters.index(letter) + 1
  end
}

puts result