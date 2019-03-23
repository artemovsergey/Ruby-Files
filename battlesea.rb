# Игра "Морской бой"

class String
  def black;          "\033[30m#{self}\033[0m" end
  def red;            "\033[31m#{self}\033[0m" end
  def green;          "\033[32m#{self}\033[0m" end
  def brown;          "\033[33m#{self}\033[0m" end
  def blue;           "\033[34m#{self}\033[0m" end
  def magenta;        "\033[35m#{self}\033[0m" end
  def cyan;           "\033[36m#{self}\033[0m" end
  def gray;           "\033[37m#{self}\033[0m" end
  def bg_black;       "\033[40m#{self}\033[0m" end
  def bg_red;         "\033[41m#{self}\033[0m" end
  def bg_green;       "\033[42m#{self}\033[0m" end
  def bg_brown;       "\033[43m#{self}\033[0m" end
  def bg_blue;        "\033[44m#{self}\033[0m" end
  def bg_magenta;     "\033[45m#{self}\033[0m" end
  def bg_cyan;        "\033[46m#{self}\033[0m" end
  def bg_gray;        "\033[47m#{self}\033[0m" end
  def bold;           "\033[1m#{self}\033[22m" end
  def reverse_color;  "\033[7m#{self}\033[27m" end
end

# 10 * 10
field = [

		   "**********",
		   "**********",
	       "**********",
	       "**********",
	       "**********",
	       "**********",
	       "**********",
	       "**********",
	       "**********",
	       "**********"
		  ]

new_field = [

		   "**********",
		   "**********",
	       "**********",
	       "**********",
	       "**********",
	       "**********",
	       "**********",
	       "**********",
	       "**********",
	       "**********"
		  ] 

# массив занятых позиций
arr = []

# массив кораблей пользователя
user_ships = []
ships_4 = []
ships_3 = []
ships_2 = []
ships_1 = []

# вывод поля
def print_field(field)
	# можно обработать вывод поля
	puts
	puts field
	puts
end

# Функция рандом строит заданные корабли 1*4,2*3,3*2,4*1 в поле
# volume - сколько палуб
# count - количество кораблей

def random_ships(field,user_ships,arr,volume,count,flag)

	# добавляет в arr всех соседей точки 
	def epsilon_point(field,random_y,random_x,arr)
					
		arr<<(random_y - 1).to_s + random_x.to_s if field[random_y - 1] != nil && random_y - 1 >= 0
		arr<<(random_y + 1).to_s + random_x.to_s if field[random_y + 1] != nil && random_y + 1 < 10
		arr<<(random_y).to_s + (random_x + 1).to_s if field[random_y][random_x + 1] != nil && random_x + 1 < 10
		arr<<(random_y).to_s + (random_x - 1).to_s if field[random_y][random_x - 1] != nil && random_x - 1 >= 0
						
		arr<<(random_y - 1).to_s + (random_x - 1).to_s if field[random_y - 1] != nil && random_y - 1 >= 0 && random_x - 1 >= 0
		arr<<(random_y - 1).to_s + (random_x + 1).to_s if field[random_y - 1] != nil && random_y - 1 >= 0 && random_x + 1 < 10
		arr<<(random_y + 1).to_s + (random_x + 1).to_s if field[random_y + 1] != nil && random_y + 1 < 10 && random_x + 1 < 10
		arr<<(random_y + 1).to_s + (random_x - 1).to_s if field[random_y + 1] != nil && random_y + 1 < 10 && random_x - 1 >= 0		
	end

	j = 0
	while j < count # сколько надо кораблей?

		# выбрать рандомную клетку из поля
		random_y = rand(0..9)
		random_x = rand(0..9)
		
		while arr.include?(random_y.to_s + random_x.to_s)
			random_y = rand(0..9)
			random_x = rand(0..9)
		end
		
		# проверить можно ли от этой позиии отложить в разные стороны по 4 клетки
		# не выходя за пределы поля

			# сколько палуб должно быть у корабля
			k = volume - 1

			# if field[random_y - k] != nil && random_y - k >= 0
			# 	puts "Можно двигаться вверх на #{k + 1}" 
			# 	# field[random_y - k][random_x] = 'U'
			# else
			# 	puts "Нельзя двигаться вверх на #{k + 1}"
			# end

			# if field[random_y + k] != nil && random_y + k < 10
			# 	puts "Можно двигаться вниз на #{k + 1}" 
			# 	# field[random_y + k][random_x] = 'D'
			# else
			# 	puts "Нельзя двигаться вниз на #{k + 1}"
			# end

			# if field[random_y][random_x + k] != nil && random_x + k < 10
			# 	puts "Можно двигаться направо на #{k + 1}" 
			# 	# field[random_y][random_x + k] = 'R'
			# else
			# 	puts "Нельзя двигаться направо на #{k + 1}"
			# end

			# if field[random_y][random_x - k] != nil && random_x - k >= 0
			# 	puts "Можно двигаться налево на #{k + 1}" 
			# 	# field[random_y][random_x - k] = 'L'
			# else
			# 	puts "Нельзя двигаться налево на #{k + 1}"
			# end

			while true

			    # если можно двигаться вверх
				if field[random_y - k] != nil && random_y - k >= 0 && !arr.include?((random_y-k).to_s + random_x.to_s)

					# field[random_y][random_x] = '1'
					# field[random_y - 1][random_x] = '2'
					# field[random_y - 2][random_x] = '3'
					# field[random_y - 3][random_x] = '4'

					for i in 0..volume-1
					   field[random_y - i][random_x] = flag
					end

					# записываем в массив сами координаты
					# arr.push(
					# 	random_y.to_s + random_x.to_s,
					# 	(random_y - 1).to_s + random_x.to_s,
					# 	(random_y - 2).to_s + random_x.to_s,
					# 	(random_y - 3).to_s + random_x.to_s
					# 	)

					for i in 0..volume-1
					   arr.push( (random_y - i).to_s + random_x.to_s )
					   user_ships.push( (random_y - i).to_s + random_x.to_s )
					   ships_4.push( (random_y - i).to_s + random_x.to_s ) if volume == 4
					   ships_3.push( (random_y - i).to_s + random_x.to_s ) if volume == 3
					   ships_2.push( (random_y - i).to_s + random_x.to_s ) if volume == 2
					   ships_1.push( (random_y - i).to_s + random_x.to_s ) if volume == 1
					end


					# и окрестность каждой точки
	
					# epsilon_point(field,random_y - 0,random_x,arr)
					# epsilon_point(field,random_y - 1,random_x,arr)
					# epsilon_point(field,random_y - 2,random_x,arr)
					# epsilon_point(field,random_y - 3,random_x,arr)

					for i in 0..volume-1
					   epsilon_point(field,random_y - i,random_x,arr)
					end


					break
				end

				# если можно двигаться вниз
				if field[random_y + k] != nil && random_y + k < 10 && !arr.include?((random_y + k).to_s + random_x.to_s)

					# field[random_y][random_x] = '1'

					# field[random_y + 1][random_x] = '2'
					# field[random_y + 2][random_x] = '3'
					# field[random_y + 3][random_x] = '4'

					for i in 0..volume - 1
					   field[random_y + i][random_x] = flag
					end

					# записываем в массив сами координаты
					# arr.push(
					# 	random_y.to_s + random_x.to_s,
					# 	(random_y + 1).to_s + random_x.to_s,
					# 	(random_y + 2).to_s + random_x.to_s,
					# 	(random_y + 3).to_s + random_x.to_s
					# 	)

					for i in 0..volume-1
					   arr.push( (random_y + i).to_s + random_x.to_s )
					   user_ships.push( (random_y + i).to_s + random_x.to_s )
					end
					# и окрестность каждой точки

					# epsilon_point(field,random_y,random_x,arr)
					# epsilon_point(field,random_y + 1,random_x,arr)
					# epsilon_point(field,random_y + 2,random_x,arr)
					# epsilon_point(field,random_y + 3,random_x,arr)

					for i in 0..volume-1
					   epsilon_point(field,random_y + i,random_x,arr)
					end

					break

					# заносим координаты точек в массив для контроля
					# то есть надо занести в массив точку и ее окрестность 4 + 1 = 5 точек
				end

				# если можно двигаться направо
				if field[random_y][random_x + k] != nil && random_x + k < 10 && !arr.include?((random_y).to_s + (random_x+k).to_s)

					# field[random_y][random_x] = '1'

					# field[random_y][random_x + 1] = '2'
					# field[random_y][random_x + 2] = '3'
					# field[random_y][random_x + 3] = '4'

					for i in 0..volume - 1
					   field[random_y][random_x + i] = flag
					end

					# записываем в массив сами координаты
					arr.push(
						random_y.to_s + random_x.to_s,
						(random_y).to_s + (random_x+1).to_s,
						(random_y).to_s + (random_x+2).to_s,
						(random_y).to_s + (random_x+3).to_s
						)


					for i in 0..volume-1
					   arr.push( (random_y).to_s + (random_x + i).to_s )
					   user_ships.push( (random_y).to_s + (random_x + i).to_s )
					end

					# и окрестность каждой точки

					# epsilon_point(field,random_y,random_x,arr)
					# epsilon_point(field,random_y,random_x+1,arr)
					# epsilon_point(field,random_y,random_x+2,arr)
					# epsilon_point(field,random_y,random_x+3,arr)

					for i in 0..volume-1
					   epsilon_point(field,random_y,random_x+i,arr)
					end

					break

					# заносим координаты точек в массив для контроля
					# то есть надо занести в массив точку и ее окрестность 4 + 1 = 5 точек
				end

				# если можно двигаться налево
				if field[random_y][random_x - k] != nil && random_x - k >= 0 && !arr.include?((random_y).to_s + (random_x-k).to_s)

					# field[random_y][random_x] = '1'

					# field[random_y][random_x - 1] = '2'
					# field[random_y][random_x - 2] = '3'
					# field[random_y][random_x - 3] = '4'


					for i in 0..volume - 1
					   field[random_y][random_x - i] = flag
					end


					# записываем в массив сами координаты
					# arr.push(
					# 	random_y.to_s + random_x.to_s,
					# 	(random_y).to_s + (random_x-1).to_s,
					# 	(random_y).to_s + (random_x-2).to_s,
					# 	(random_y).to_s + (random_x-3).to_s
					# 	)

					for i in 0..volume-1
					   arr.push( (random_y).to_s + (random_x - i).to_s )
					   user_ships.push( (random_y).to_s + (random_x - i).to_s )
					end
					# и окрестность каждой точки

					# epsilon_point(field,random_y,random_x,arr)
					# epsilon_point(field,random_y,random_x-1,arr)
					# epsilon_point(field,random_y,random_x-2,arr)
					# epsilon_point(field,random_y,random_x-3,arr)

					for i in 0..volume-1
					   epsilon_point(field,random_y,random_x-i,arr)
					end

					break

					# заносим координаты точек в массив для контроля
					# то есть надо занести в массив точку и ее окрестность 4 + 1 = 5 точек
				end

			end
		j+=1
	end
	# puts arr.to_s
	# puts "Массив занятых ячеек: " + arr.uniq!.to_s
	# puts
	# puts arr.size
	# puts "Массив кораблей: " + user_ships.to_s
	# puts user_ships.size
	# puts
end


# осуществляем построение всех кораблей

random_ships(field,user_ships,arr,4,1,'4')
# random_ships(field,user_ships,arr,3,2,'3')
# random_ships(field,user_ships,arr,2,3,'2')
# random_ships(field,user_ships,arr,1,4,'1')

# смотрим диспозицию на карте
puts "Итоговая диспозиция на карте: "
print_field(field)

sleep(5)
system('cls')




while true

	# puts "Массив кораблей: " + user_ships.to_s
	# puts user_ships.size
	print "Введите координаты удара (00..99): "
	user_input = gets.chomp
	get_x = user_input[0].to_i
	get_y = user_input[1].to_i
	# puts field[get_x][get_y]

	if (field[get_x][get_y] == '4') or (field[get_x][get_y] == '3') or (field[get_x][get_y] == '2') or (field[get_x][get_y] == '1')
		puts "Результат: Вы ранили корабль!".green
		

		# проверить есть ли соседи, если нет - это 1. Можно выводить Вы убили!
		# 
		# for i in 1..10
		# 	break if field[get_x - i][get_y] == "*"
		# end

		# print "При движении вверх есть еще #{i-1}"
		




		# todo  когда убили корабль? сколько убили?
		new_field[get_x][get_y] = 'X'


		# удаляем такие координаты из массива user_ships
		user_ships.delete(get_x.to_s + get_y.to_s)
		# puts user_ships.size

		# system('cls')
		print_field(new_field)
	else
		puts "Результат: Мимо!".red
		new_field[get_x][get_y] = "O"
		# system('cls')
		print_field(new_field)
	end

	# проверка все ли целы корабли?
	# игра продолжается до тех пор пока есть массив кораблей

	if user_ships.size == 0
		  puts "\\     /  _____                                       O           ___".red
	      puts " \\   /  [     ] |      |     \\        /\\        /   | |  |\\    | | |".blue
	      puts "  \\ /   |     | |      |      \\      /  \\      /    | |  | \\   | | |".cyan
	      puts "   |    |     | |      |       \\    /    \\    /     | |  |  \\  | | |".magenta
	      puts "   |    |     | |      |        \\  /      \\  /      | |  |   \\ | | |".cyan
	      puts "   |    [_____] [______]         \\/        \\/       |_|  |    \\|  O ".gray
		break
	end

end