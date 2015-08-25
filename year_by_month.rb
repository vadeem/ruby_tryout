year2015 = {
	:jan => 31,
	:feb => 28,
	:mar => 31,
	:apr => 30,
	:may => 31,
	:jun => 30,
	:jul => 31,
	:aug => 31,
	:sep => 30,
	:oct => 31,
	:nov => 30,
	:dec => 31
}

year2015.each do |name, days|
	if ( days == 30 )
		puts name, days
	end
end