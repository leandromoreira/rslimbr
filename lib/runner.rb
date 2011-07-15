class Runner
	@@DEFAULT_PORT = 8085
	attr_accessor :port
	def initialize(parameter)
		if parameter == nil 
			@port = @@DEFAULT_PORT
		else
			if parameter.to_s.include? "DSLIM_PORT"
				@port = parameter.split('=')[1].to_i
			else
				@port = parameter.to_i
				@port = (@port==0)?@@DEFAULT_PORT:@port
			end
		end
	end	
end
