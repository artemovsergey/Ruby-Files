=begin
	
Алгоритмы двойных перестановок. Сначала в таблицу записывается текст сообщения,
а потом поочередно переставляютсястолбцы, а затем строки. При расшифровке порядок перестановок
будет обратный. 

=end

# Исходная строка

str = "Сегодня новый день"

def column_reshufle(str,n)

   str.each_char {|char| str.delete!(char) if char == " "}
   str = str.split(//)

   s = []  # элемент массива = строка
   i = 0
   while i <= str.size-1
  	# print str[i...i+4]
    s<<str[i...i+n]
    # puts
    i+=n
   end

    column = []

    j=0
    while j<s.size
      for string in s
        column<<string[j]
      end
      j+=1
    end

    column4 = []
    i = 0
    while i <= column.size-1
       # print column[i...i+4]
       column4<<column[i...i+n]
        # puts
       i+=4
	end

	column4[0],column4[2] = column4[2],column4[0]
	column4[1],column4[2] = column4[2],column4[1]
	column4[2],column4[3] = column4[3],column4[2]

   return column4.join  # возвращаем зашифрованную строку
end

puts column_reshufle(str,4)
str = column_reshufle(str,4)

def string_reshufle(str,n)

   str.each_char {|char| str.delete!(char) if char == " "}
   str = str.split(//)

   s = []
   i = 0
   while i <= str.size-1
  	# print str[i...i+4]
    s<<str[i...i+n]
    # puts
    i+=n
   end

	def transponse(s)

		    column = []

		    j=0
		    while j<s.size
		      for string in s
		        column<<string[j]
		      end
		      j+=1
		    end

			    column4 = []
			    i = 0
			    while i <= column.size-1
			       # print column[i...i+4]
			       column4<<column[i...i+4]
			        # puts
			       i+=4
				end

				return column4			
	end

	   s = transponse(s)

	   s[0],s[3] = s[3],s[0]
	   s[0],s[2] = s[2],s[0]
	   s[0],s[1] = s[1],s[0]



   return s.join  # возвращаем зашифрованную строку
end

puts string_reshufle(str,4)
