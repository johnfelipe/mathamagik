include ApplicationHelper

class StaticPagesController < ApplicationController


def new 
	puts "in New!\n"

end

def opactions
	puts "YOA!!!!"
	action = params[:value]
	puts "got value " + action
	@op,@symbol = getoperation(action)
	puts "OPERATION ISS" + @op.to_s
end
	

def home
	print "in home!\n"
	@operation = params[:operation]
	@value = params[:value]
	puts @operation
	puts @value

end

end
