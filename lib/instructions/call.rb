class Call
	attr_accessor :symbols
	def initialize(instances)
		@instances = instances
		@symbols = {}
	end
	def call(instance,function,args=nil)
		if args.nil?
			returned_value = @instances[instance].send function
		else
			returned_value = @instances[instance].send function,*args
		end
		if (returned_value.nil?)
    	returned_value = "__VOID__"
    end
		returned_value
	end
	def call_and_assign(symbol,instance,function,args=nil)
		symbols[symbol] = call instance,function,args
	end
end
