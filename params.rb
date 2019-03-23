

def test(t,*params,**dictions)

	'''
	*params  - все позиционные параметры оформляет в массив,
	начиная с этой позиции

	**dictions - все ключевые параметры оформляет в словарь, начиная с этой
	позиции

	'''
	
	summa = 0
	for i in params
		summa+=i
	end

	puts(summa)
	puts(dictions.to_s)
	puts(params.to_s)

end

test(1,2,3,4,c:3,d:5)