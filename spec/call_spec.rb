describe Call do
	describe "Import Instruction" do
		it "shoud call sum given the instance and should return the sum" do
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
