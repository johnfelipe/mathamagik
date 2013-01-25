include ApplicationHelper

class OperationsController < ApplicationController
	def new
		op = Operation.new
		puts "Yo, operation"
		puts params[:count]
		puts params[:operation]
		@operation = params[:operation]
		@count = params[:count]
		@symbol = ""
		options = Array.new()

		for j in (0..4)
			#fragile - assumes no more than 4 options per
			opt = "option" + j.to_s
			if params[opt].present?
				options[j] = opt
			end
		end
		if (@operation == nil)
			#dont allow direct access to page
			redirect_to '/'
			return
		end
		ret = getoperation(@operation)
		optype = ret[0]
		@symbol = ret[1]
		#puts "OPERATION..........." + optype
		#puts "SYMBOLS .........." + @symbol.to_s
		#puts "OPTIONS............" + params[:options]
		generate(@count)
		postprocess_data(options, optype)
		op.top = @top
		op.bottom = @bottom
		op.optype = optype
		op.numdigits = @count.to_i
		op.save
		cookies.permanent[:cookie] = op.cookie
	end

	def postprocess_data(options, optype)
		puts "POST!!!.."
		if (options.size == 0)
			puts "no options, returning !!"
			return
		else
			if (optype == OP_ADDITION)
				# only option is numberator bigger
				puts "addition.."
				if (@count.to_i == 1)
					for j in (0..@top.count-1)
						if (@top[j]+ @bottom[j] < 10 )
							r = 1.times.map{Random.rand(10)}
							@top[j] = @top[j]+r[0]
						end
					end
				end
			elsif (optype == OP_SUBSTRACTION)
				puts "sub"
			elsif (optype == OP_MULTIPLICATION)
				puts "mult"
			else (optype == OP_DIVISION)
				puts "div"
			end
		end
	end




	def answer
		puts "YO ANSWER+++++++++++++++++++++"
		@op = Operation.find_by_cookie(cookies[:cookie])
		# set a flag if the numerator is more digits than denominator
		puts @op.optype
		#@op.top[0] + @op.bottom[0]
		respond_to do |format|
			format.html {redirect_to "/"}
			format.js {}
		end
	end

	def generate(cnt)
		puts "generating add for count #{@count}"

		case @count.to_i
		when 1 
			puts "COUNT IS 1!!!!!!!!"
			@top = 10.times.map{ Random.rand(10) }
			@bottom = 10.times.map{ Random.rand(10)}  
		when 2 
			@top = 10.times.map{ Random.rand(10..99)}  
			@bottom = 10.times.map{ Random.rand(10..99)}  
		when 3 
			@top = 10.times.map{ Random.rand(100..999)  }
			@bottom = 10.times.map{ Random.rand(100..999)}  
		when 4 
			@top = 10.times.map{ Random.rand(1000..9999) }
			@bottom = 10.times.map{ Random.rand(1000..9999)}  
		when 5 
			@top = 10.times.map{ Random.rand(10000..99999)  }
			@bottom = 10.times.map{ Random.rand(10000..99999)} 
		end
		#let's sort them nicely to make the client code easier
		tmp =0
		#puts "...TOP  #{@top}, #{@bottom} , count #{@top.count}"

		for i in 0..(@top.count()-1)
			#puts "++ " + i.to_s + "++"
			#puts "top" + @top[i].to_s + "bottom" + @bottom[i].to_s
			if (@top[i] < @bottom[i])
				tmp = @top[i]
				@top[i] = @bottom[i]
				@bottom[i] = tmp
			end
			#puts "top" + @top[i].to_s + "bottom" + @bottom[i].to_s

		end
		puts "...TOP  #{@top}, #{@bottom}"
	end

	def solution
		#puts "tops is" + @bottom
		redirect_to '/'
	end

	def more
		redirect_to '/'
	end

end



