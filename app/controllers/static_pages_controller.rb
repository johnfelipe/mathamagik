class StaticPagesController < ApplicationController


def new 
	puts "in New!\n"

end

def home
	print "in home!\n"
	@operation = params[:operation]
	@value = params[:value]
	puts @operation
	puts @value

end

end
