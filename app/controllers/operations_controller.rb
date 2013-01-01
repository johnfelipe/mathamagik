include OperationsHelper
class OperationsController < ApplicationController
@count = "0"
@top = Array.new
@bottom =Array.new
@symbol = ""
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
		puts "...TOP  #{@top}, #{@bottom}"
	end

	def solution
		puts "tops is" + @bottom
	end

	def more
	end

end



