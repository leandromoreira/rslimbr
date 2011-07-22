#specs from http://fitnesse.org/FitNesse.UserGuide.SliM.SlimProtocol.PortManagement
require File.dirname(__FILE__) + '/../lib/instructions/make'

describe Make do
	before(:all) do
		@make = Make.new
	end
	describe "Make Instruction" do
		it "should keep an instance of String at instance01 key" do
			created_object = "args"
			@make.build "instance01", "String",["args"]
			@make.instances["instance01"].should == created_object
		end
	end
end
=begin
Make: [<id>, make, <instance>, <class>, <arg>...] 

This instruction causes slim to search for a class named <class> in the imported search paths. <class> can also be fully qualified. If found slim looks for a constructor with the right number of arguments. If found, the <arg> strings are converted to the appropriate types, and the constructor is called. The newly create instance is registered under the name <instance>, and the instruction returns OK.
=end
