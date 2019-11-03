def summa(a,b,&block)

	puts "Принимаем блок!"
	p block.call(a,b)
end


summa 5,3 do |a,b| 
	[a,b,3,4]
end