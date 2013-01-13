module ApplicationHelper
	MAX_PER_ROW = 5 
	SPANS_PER_NUM = 2  
	TOTAL_SPANS = 12

	#OPERATIONS 
	OP_ADDITION = 1
	OP_SUBSTRACTION = 2
	OP_MULTIPLICATION = 3
	OP_DIVISION = 4
	OP_UNKNOWN = 0


	def getoperation(action)
		puts "OP action is" + action
		if (action == "addition")
			op= OP_ADDITION
			symbol = 0x002b
		elsif (action=="substraction")
			op = OP_SUBSTRACTION
			symbol = 0x2212
		elsif (action == "division")
			op = OP_DIVISION
			symbol = 0x00f7
		elsif (action == "multiplication")
			op = OP_MULTIPLICATION
			symbol = 0x00d7
		else
			op = OP_UNKNOWN
			symbol = '??'
		end
		puts "returning" + op.to_s
		return op, symbol
	end
end