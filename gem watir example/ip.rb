

require 'watir'
require 'webdrivers'

puts "Проверка ip"

# Создаем объект класса Brouser
# По умолчанию Chorome
browser = Watir::Browser.new :chrome

# методо goto
browser.goto 'https://2ip.ru/'



# browser.text_field(title: 'Search').set 'Hello World!'
# browser.text_field(id: 'lst-ib').set 'Hello World!'
# sleep 1


# Нажатие кнопки
# browser.button(type: 'submit').click
# browser.button(value: 'Поиск в Google').click
# btn.exists?
# btn.click

sleep 10
# puts browser.title

# метод quit
browser.quit


puts 
puts "Работа завершена"
sleep 1