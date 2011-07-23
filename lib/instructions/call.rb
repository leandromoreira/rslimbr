class Call
	def initialize(instances)
		@instances = instances
	end
	def call(instance,function,args=nil)
		if args.nil?
			returned_value = @instances[instance].send function
		else
			returned_value = @instances[instance].send function,*args
		end
		 (returned_value.nil?)?"__VOID__":returned_value   	
	end
end
