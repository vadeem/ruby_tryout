year2015 = {
	:jan => (1..31),
	:feb => (1..28),
	:mar => (1..31),
	:apr => (1..30),
	:may => (1..31),
	:jun => (1..30),
	:jul => (1..31),
	:aug => (1..31),
	:sep => (1..30),
	:oct => (1..31),
	:nov => (1..30),
	:dec => (1..31)
}

year2015.each do |name, month|
	if ( month.size == 30 )
		puts name, month
	end
end