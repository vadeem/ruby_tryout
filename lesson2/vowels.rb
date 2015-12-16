letters = ('a'..'z').to_a
vowels = ['a','e','i','o','u']

result = {}

letters.each{ |letter|
  if( vowels.include? letter )
    result[ letter ] = letters.index(letter) + 1
  end
}

puts result