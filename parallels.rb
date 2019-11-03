puts "begin"

th = Thread.new {(1..3).each { |i| puts i } }

sleep 0.1
puts "==="
th.join

puts "end"