require 'constants'

class Make
		attr_accessor :instances
		def initialize(imports=nil)
			@instances = {}
			@imports = imports
		end
		def build(instance,clazz,args=nil)
			if args.nil?
				begin
					@instances[instance] = Object.const_get(clazz).new
				rescue NameError
					create_using_imports(instance,clazz,args)
				end
			else
				begin
					@instances[instance] = Object.const_get(clazz).new(*args)
				rescue NameError
					create_using_imports(instance,clazz,args)
				end
			end 
      Constants::Success  
		end
		private
		def create_using_imports(instance,clazz,args=nil)
			@imports.each do |import|
				begin
					if args.nil?
						@instances[instance] = Object.const_get("#{import}.#{clazz}").new
						return
					else
						@instances[instance] = Object.const_get("#{import}.#{clazz}").new(*args)
						return
					end
				rescue NameError
				end
			end
		end
end
