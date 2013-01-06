include OperationsHelper

class OperationsController < ApplicationController
	def new
		puts "Yo, operation"
		puts params[:count]
		puts params[:operation]
		@operation = params[:operation]
		@count = params[:count]
		@symbol = ""
		puts "OPERATION..........." + @operation
		if (@operation == "addition")
			@symbol = 0x002b
		elsif (@operation=="substraction")
			@symbol = 0x2212
		elsif (@operation == "division")
			@symbol = 0x00f7
		elsif (@operation == "multiplication")
			@symbol = 0x00d7
		else
			@symbol = "??"
		end
		generate(@count)
		op = Operation.new
		op.top = @top
		op.bottom = @bottom
		op.save
		cookies.permanent[:cookie] = op.cookie
	end

	def answer
		puts "YO ANSWER+++++++++++++++++++++"
		@op = Operation.find_by_cookie(cookies[:cookie])
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

		for i in 0..(@top.count() -1)
			#puts "++ " + i.to_s + "++"
			#puts "top" + @top[i].to_s + "bottom" + @bottom[i].to_s
			if (@top[i] < @bottom[i])
				puts "switch.."
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



