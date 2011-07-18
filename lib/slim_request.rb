class SlimRequest
	attr_accessor :message, :instructions
	def initialize(size)
		@size = size.to_i
	end
	def size
		@size
	end
end
