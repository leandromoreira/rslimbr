require 'list'

class SlimRequest
	attr_accessor :message, :instructions, :list
	def initialize(size)
		@size = size.to_i
		@list = List.new
	end
	def size
		@size
	end
	def response
	end
end
