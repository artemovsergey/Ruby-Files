l = gets.to_i
mas = gets.chomp.split(" ").map { |i| i.to_i }

if l>=1 or l<=2*(10**4)
	for numb in mas
		if numb <= 0 or numb > 10**9
			#raise SystemExit
			abort "Error"
		end
	end
	min_numb = mas.min
	sum1 = 0
	for numb in mas
		if numb % min_numb == 0
			sum1 += 1
		end
	end
	print(min_numb," ",sum1)
end

