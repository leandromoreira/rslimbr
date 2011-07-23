class Call
	def initialize(instances)
		@instances = instances
	end
	def call(instance,function,args=nil)
		if args.nil?
			@instances[instance].send function
		else
			@instances[instance].send function,*args
		end 	
	end
end
