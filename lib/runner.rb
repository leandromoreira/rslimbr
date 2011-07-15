class Runner
	attr_accessor :port
	def initialize(parameter)
		if parameter == nil 
			@port = 8085
		else
			if parameter.to_s.include? "DSLIM_PORT"
				@port = parameter.split('=')[1].to_i
			else
				@port = parameter.to_i
			end
		end
	end	
end
