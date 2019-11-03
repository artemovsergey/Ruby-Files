require 'sqlite3'

# подключим базу данных (которую делали выше)
db = SQLite3::Database.new 'test.sqlite'

# создадим таблицу

#db.execute "CREATE TABLE Cars (Id INTEGER PRIMARY KEY AUTOINCREMENT, Name VARCHAR, Price INTEGER)"

# добавим новую информацию в базу данных
db.execute "INSERT INTO Cars (Name, Price) VALUES ('Jaguar', 7000000)"

# прочитаем данные из базы
db.execute "SELECT * FROM Cars" do |car|
  p car
  puts "======"
end

db.close