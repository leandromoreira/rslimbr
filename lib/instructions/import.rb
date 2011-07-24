require 'constants'

class Import
	attr_accessor :id
	def initialize(id)
		@id = id
    @paths = {}
	end

	def add(path)
   @paths[path] = path
   Constants::Success
	end
	def get(path)
		@paths[path]	
	end
	def imports
		@paths
	end
end
