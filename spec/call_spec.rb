#specs from http://fitnesse.org/FitNesse.UserGuide.SliM.SlimProtocol
require File.dirname(__FILE__) + '/../lib/instructions/call'
require File.dirname(__FILE__) + '/../lib/instructions/make'

describe Call do
		before(:all) do
			@make = Make.new
			@make.build("instance0", "String","test")
			@call = Call.new @make.instances
		end
		
		describe "Import Instruction" do
			it "shoud call sum function given the instance and it should return the sum" do
				returned_value = @call.call "instance0","sum"
				returned_value.should == 448
			end
			it "shoud call index('e') and it should return the 1" do
				returned_value = @call.call "instance0","index",'e'
				returned_value.should == 1
			end
			it "shoud call xxx and returns __VOID__" do
			end
	end
end

=begin
Call: [<id>,call,<instance>,<function>,<arg>...] 
This instruction causes slim to find a function named <function> in the class of the object registered under <instance>. 
The function must have the same number of arguments as the instruction. 
If found, each argument in the instruction is converted to the appropriate type, and then the function is called on the instance. 
If the function returns a value, it is converted to a string and returned. 
Otherwise the instruction returns the string: /__VOID__/.
=end
