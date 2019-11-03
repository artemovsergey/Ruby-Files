

# И171
list1 = ["Черненко","Лазаренко","Подрезов","Афанасьев","Койчуева","Курбанов"]
list2 = ["Данилов","Золотухин","Гончарова","Гребенев"]
# Кто присутствует
list = list1 + list2

# И170
# list1 = ["Егоров","Торпиков","Азизов","Сиренко","Щербинин","Кипа"]
# list2 = ["Рудаков","Горбатенко","Ержаков","Самсонов","Степаненко","Орехов","Озиев","Устаев"]
# list = list1 + list2


file = File.new('data.txt','r:UTF-8')
content = file.read
content = content[1..-1].split(/\n/)

white_list = []
for student in content
   white_list << student if list.include?(student)
end
puts
puts "Нет в списке выбора дежурных: "
puts
white_list.each {|i| puts i}
sleep 3
system('cls')


for i in white_list
  list.delete(i)
end



puts "Выбираем дежурных: "
sleep 3

while list.size>2

puts "Перемешиваем..."
sleep 3
list.shuffle

puts "Осталось студентов: #{list.size} "
puts
list.each {|i| puts i}


puts '___________________'
user = list.sample
puts "Повезло: #{user}"
list.delete(user)
sleep 3
system('cls')

end


puts "Итак, сегодня дежурные: #{list[0]},#{list[1]}"

file = File.new('data.txt','a:UTF-8')
file.puts("#{Time.new.strftime('%d.%m')}: ")
file.puts(list[0],list[1])
file.close