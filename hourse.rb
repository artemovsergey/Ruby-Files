words ='abcdefgh'
ints = '12345678'



public
  def bg_red;         "\033[41m#{self}\033[0m" end
  def green;          "\033[32m#{self}\033[0m" end
  def bg_green;       "\033[42m#{self}\033[0m" end
  def magenta;        "\033[35m#{self}\033[0m" end
  def bg_blue;        "\033[44m#{self}\033[0m" end


get_hash = {

	"a" => 1,
	"b" => 2,
	"c" => 3,
	"d" => 4,
	"e" => 5,
	"f" => 6,
	"g" => 7,
	"h" => 8
}

	 pole = [
	 			  '********','********','********','********',
				  '********','********','********','********'
			]


def print_pole(pole)
	 puts
			for i in 0..7
				print "\t"
				puts pole[i]
			end
	 puts
end

print_pole(pole)


all_position = []
for i in 0..7 
 for j in 0..7
   all_position<<words[i]+ints[j]
 end
end

print "Введите координаты: "
get_xy = gets.chomp

pole[get_hash[get_xy[0]]- 1][get_xy[1].to_i - 1] = 'H'
print_pole(pole)

# массив возможных ходов коня по заданной координате
def hourse_positions(get_xy,words,ints)
	
	get_x = get_xy[0]
	get_y = get_xy[1]

	for i in 0..7
		if words[i] == get_x
			i_getx_x = i
		end
	end

	values_position = []

	# вправо на 1 вверх
	step = 1
	if (i_getx_x + step >= 0) and  (get_y.to_i + 2 - 1) >= 0
		if (words[i_getx_x + step] != nil) and (ints[get_y.to_i + 2 - 1]) != nil
			values_position<<words[i_getx_x + step] + ints[get_y.to_i + 2 - 1]
		end
	end

	# вправо на 1 вниз
	if (i_getx_x + step >= 0) and  (get_y.to_i - 2 - 1) >= 0
		if (words[i_getx_x + step] != nil) and (ints[get_y.to_i - 2 - 1]) != nil
			values_position<<words[i_getx_x + step] + ints[get_y.to_i - 2 - 1]
		end
	end

	# вправо на 2 вниз
	step = 2
	if (i_getx_x + step >= 0) and  (get_y.to_i - 1 - 1) >= 0
		if (words[i_getx_x + step] != nil) and (ints[get_y.to_i - 1 - 1]) != nil
			values_position<<words[i_getx_x + step] + ints[get_y.to_i - 1 - 1]
		end
	end

	# вправо на 2 вверх
	if (i_getx_x + step >= 0) and  (get_y.to_i + 1 - 1) >= 0
		if (words[i_getx_x + step] != nil) and (ints[get_y.to_i + 1 - 1]) != nil
			values_position<<words[i_getx_x + step] + ints[get_y.to_i + 1 - 1]
		end
	end

	###

	# влево на 1 вверх
	step = -1
	if (i_getx_x + step >= 0) and  (get_y.to_i + 2 - 1) >= 0
		if (words[i_getx_x + step] != nil) and (ints[get_y.to_i + 2 - 1]) != nil
			values_position<<words[i_getx_x + step] + ints[get_y.to_i + 2 - 1]
		end
	end

	# влево на 1 вниз
	if (i_getx_x + step >= 0) and  (get_y.to_i - 2 - 1) >= 0
		if (words[i_getx_x + step] != nil) and (ints[get_y.to_i - 2 - 1]) != nil
			values_position<<words[i_getx_x + step] + ints[get_y.to_i - 2 - 1]
		end
	end

	# влево на 2 вниз
	step = - 2
	if (i_getx_x + step >= 0) and  (get_y.to_i - 1 - 1) >= 0
		if (words[i_getx_x + step] != nil) and (ints[get_y.to_i - 1 - 1]) != nil
			values_position<<words[i_getx_x + step] + ints[get_y.to_i - 1 - 1]
		end
	end

	# влево на 2 вверх
	if (i_getx_x + step >= 0) and  (get_y.to_i + 1 - 1) >= 0
		if (words[i_getx_x + step] != nil) and (ints[get_y.to_i + 1 - 1]) != nil
			values_position<<words[i_getx_x + step] + ints[get_y.to_i + 1 - 1]
		end
	end

	return values_position
end

all_points = hourse_positions(get_xy,words,ints)
puts all_points.to_s

print "Введите координаты конечной точки: "
point_xy = gets.chomp

pole[get_hash[point_xy[0]]- 1][point_xy[1].to_i - 1] = 'O'
print_pole(pole)


n = 1
count = []
while true

	if all_points.include?(point_xy)
		# count<<get_xy	
		break
	end
   
   	random = rand(0..all_points.size-1)
   	count<<all_points[random]
    all_points = hourse_positions(all_points[random],words,ints)
    puts all_points.to_s

    # sleep 1
    n+=1
end

puts
puts "Начальная позиция: #{get_xy}"
puts "В #{point_xy} можно попасть через #{count.to_s}. Количество шагов: #{n}"

system('cls')
m = 1

for i in 0..count.size-1
	#
	pole[get_hash[count[i][0]]- 1][count[i][1].to_i - 1] = "#{m}" #'X' 
	print_pole(pole)
	puts "Шаг: #{m}"
	sleep 0
	system('cls')

	m += 1
	#
end



print_pole(pole)
puts count.to_s.green
puts
puts "Шаг: #{m}".bg_blue
# puts "\e[H\e[2J"

# можно оптимизировать по скорости поиска