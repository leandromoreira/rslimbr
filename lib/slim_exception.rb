class SlimException < Exception
	@@PRE_MESSAGE = "__EXCEPTION__"
	@@SEPARATOR = ":"
	def initialize(message)
		@message = "#{@@PRE_MESSAGE}#{@@SEPARATOR}#{message}" 
	end
end
