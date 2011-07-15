class Runner
	attr_accessor :port
	def initialize(parameter)
		if parameter == nil 
			@port= 8085
		else
			@port = parameter
		end
	end	
end
