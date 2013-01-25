module OperationsHelper

#find the number of digits
def numDigits(num)
	numdig = 0
	if (num == 0)
		numdig = 1
	else
		while (num > 0)
			num /= 10
			numdig = numdig+1
		end
	end
	puts "digits: " + numdig.to_s
	numdig
end

def numToArray(num)
	digits = numDigits(num)
	puts "got digits" + digits.to_s
	exponent = 10**(digits-1)
	puts "exponent is" + exponent.to_s

	n = Array.new
	j = digits -1
	n[0]= num/exponent
	j = digits-1
	while j  > 0
		mod = 10**j
		div = 10**(j-1)
		n[digits-j]= num%mod/div
		j=j-1
	end
	puts "array is " + n.to_s
	n
end


end
