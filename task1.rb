

s = gets.chomp

def  quadrat_str(str)

    if str.size.odd?
    	return "No"
    else
    	if str[0..((str.size)/2)-1] == str[((str.size)/2)..(str.size)-1]
    		return "Yes"
    	else
    		return "No"
    	end
    end	
end

puts quadrat_str(s)



