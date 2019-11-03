=begin
	Периметр некоторого прямоугольника равер p. 
	Известно, что его ширина в k раз меньше длины. 
	Найдите площадь этого прямоугольника. 
	Длины его сторон — положительные целые числа.
=end

str = gets.chomp

def state(str)

	# длина a
	# ширина a/k
	#  s = a * (a/k)
	# p1 = 2*(a/k) + (2*a)
	# p1 = 2*( (a/k)   + a)
	# p1/2 = a/k   + a = a(1/k  + 1)
	# a = (p1/2) * (k /1+k) = (p1*k)/(2*(1+k))

	p1 = str[0].to_i
	k = str[-1].to_i

	a = (p1*k)/(2*(1+k))
	return (a*(a/k)).to_i
end


puts state(str)