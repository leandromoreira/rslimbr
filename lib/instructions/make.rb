require 'constants'

class Make
		attr_accessor :instances
		def initialize
			@instances = {}
		end

		def build(instance,clazz,args=nil)
			if args.nil?
				@instances[instance] = Object.const_get(clazz).new
			else
				@instances[instance] = Object.const_get(clazz).new(*args)
			end 
      Constants::Success  
		end
end
