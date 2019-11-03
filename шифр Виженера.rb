

def shifr_vishiners(word,key_word)

	alfavit = ("А".."Е").to_a + ("Ж".."Я").to_a
	# alfavit = ("a".."z").to_a

	alfavit = alfavit.each_with_index.map{|l,i| [l, i]}.to_h
	# хэш буква = индекс
		puts alfavit.to_s
	word.chars.map{|l| alfavit[l]}
	
	if key_word.size < word.size
		key_word = key_word*10
		key_word = key_word[0..word.size - 1]
	end

	key_word.chars.map{|l| alfavit[l]}.to_s

	sum_word = []
	for i in 0..word.size - 1
		sum_word[i] = (alfavit[word[i]] + alfavit[key_word[i]]) % 32
	end

	puts alfavit[word[0]],alfavit[key_word[0]]
	puts "Зашифрованное сообщение имеет вид: #{sum_word.map{|i| alfavit.key(i)}}"
	sum_word = sum_word.map{|i| alfavit.key(i)}.join
end


puts shifr_word = shifr_vishiners("КОМПЬЮТЕР","НЕБО")


def deshifr_vishiners(shifr_word,key_word)

	alfavit = ("А".."Е").to_a + ("Ж".."Я").to_a
	# alfavit = ("a".."z").to_a

	alfavit = alfavit.each_with_index.map{|l,i| [l, i]}.to_h
	# хэш буква = индекс

	shifr_word.chars.map{|l| alfavit[l]}
	
	if key_word.size < shifr_word.size
		key_word = key_word*10
		key_word = key_word[0..shifr_word.size - 1]
	end

	key_word.chars.map{|l| alfavit[l]}.to_s

	puts shifr_word
	puts key_word

	word = []

	for i in 0..shifr_word.size - 1
		word[i] = (alfavit[shifr_word[i]] - alfavit[key_word[i]]) % 32
	end

	puts word

	puts alfavit[shifr_word[0]],alfavit[key_word[0]]
	puts "Cообщение имеет вид: #{word.map{|i| alfavit.key(i)}}"

end


puts deshifr_vishiners(shifr_word,"НЕБО")