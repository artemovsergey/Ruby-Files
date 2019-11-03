require 'socket'

server = TCPServer.open(2000)
puts "Сервер запушен"
loop { client = server.accept;client.puts(Time.now.ctime);client.close }