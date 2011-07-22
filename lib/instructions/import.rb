class Import
	attr_accessor :id	
	def initialize(id)
		@id = id
    @paths = {}
	end

	def add(path)
   @paths[path] = path
	end
	def get(path)
		@paths[path]	
	end
end
