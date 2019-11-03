
str = gets.chomp  #'a,b,c'


def  func(str)
	str = str.split(" ")
	a,b,c = str[0].to_i,str[1].to_i,str[2].to_i

	a0 = a
	b0 = b
	
	while a + b < c && a<150 && c<=300
		a+=1
	end

	while a + b < c && b<150 && c<=300
		b+=1
	end

	return [a-a0,b-b0].join(" ")
end

puts func(str)