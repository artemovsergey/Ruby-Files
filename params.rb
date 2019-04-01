

def test(t,*params,**dictions)

	'''
	*params  - все позиционные параметры оформляет в массив,
	начиная с этой позиции

	**dictions - все ключевые параметры оформляет в словарь, начиная с этой
	позиции

	'''
	puts t
	puts params.to_s
	puts dictions.to_s

end

test(1,2,3,4,c:3,d:5)