class Make
		attr_accessor :instances
		def initialize
			@instances = {}
		end

		def build(instance,clazz,args)
			if args == nil
				@instances[instance] = Object.const_get(clazz).new
			else
				@instances[instance] = Object.const_get(clazz).new(args[0])
			end 
		end
end
