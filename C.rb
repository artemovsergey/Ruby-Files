# s =  [10,10,3,3,3,4,4,5,5,1]
s = gets.chomp

def func(str)

	s = str.split(" ")
	t = []
	count = 1
	for i in 0..s.size - 1
		if s[i] == s[i+1]
			count+=1
		else
			t<<s[i]
			t<<count.to_i
			count = 1 
		end
	end

	return t.join(' ')
end

puts func(s)


