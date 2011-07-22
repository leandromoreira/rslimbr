class Import
	attr_accessor :id	
	def initialize(id)
		@id = id
    @paths = {}
	end

	def add(path)
   @paths[path] = path
   "OK"
	end
	def get(path)
		@paths[path]	
	end
end
