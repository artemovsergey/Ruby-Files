def say
	puts "Hi"
end



def sample
    yield
end 


sample  &method(:say)