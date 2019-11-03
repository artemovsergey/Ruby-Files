require 'watir'
require 'webdrivers'

puts "Автоматизация входа на Positive.com"

browser = Watir::Browser.new :chrome

puts "1. Переходим на сайт"
browser.goto 'https://positivebet.com/'


puts "2. Нажимаем Вход"
browser.link(text: 'Вход').click

puts "3. Заполняем поле Login"
browser.text_field(id: 'UserLogin_username').set 'iof'

puts "4. Заполняем поле Password"
browser.text_field(id: 'UserLogin_password').set '003314'

puts "5. Нажимаем кнопку вход"
browser.button(value: 'Вход').click


puts "Поздравляю!"


puts "Перейдем в раздел Live"
browser.link(text: /Live-вилки/).click
# browser.goto 'https://positivebet.com/ru/bets/index'

# Надо как-то считать таблицу с вилками
# Спарсить div в котором находиться вся таблица. Стоит заметить
# что она постоянно обновляется

puts "6. Обновить"  if browser.button(id: 'btnRefresh').click == nil 
puts '_______'

# d = browser.div class: 'grid-view'
# text = browser.div(id: 'gridBets').text
# puts text
# puts text.class


sleep 5
browser.link(class: /addToCalc/).click
sleep 5









# Найти строку в которой нужная доходность

# Работать с элементами этой строки

# Идентифицируем кто первый букмекер, кто второй

# Нажимаем кнопку в этой строке занести в калькулятор

# Первым делом округляем до 100

# Теперь надо разработать алгоримт правильного
# проставления сумм при учете возможной смены
# коэффициентов

# Проходим авторизацию в контооре первого события
# Открываем новым браузер по ссылке первого события

# Проходим авторизацию в контооре второго события
# Открываем новым браузером по ссылке второго события


# ( при каждой вилке придется авторизироваться, что может привлечь внимание)
# ( надо рассмотреть вопрос с куками или делать все в одном браузере)

#





























sleep 1
browser.quit