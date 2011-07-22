#specs from http://fitnesse.org/FitNesse.UserGuide.SliM.SlimProtocol
require File.dirname(__FILE__) + '/../lib/instructions/import'

describe Import do
	describe "Import Instruction" do
		it "should add up import in context" do
			import = Import.new "id"
			import.add("Fixtures").should == "OK" 
		end
	end
end

=begin
Import: [<id>, import, <path>] 
This instruction causes the <path> to be added to the search path for fixtures. 
In java <path> gets added to the CLASSPATH. 
In .NET, the <path> would name a dll. 
You can send as many imports as you like. 
The Slim system will use all imported paths to find fixture classes. 
This instruction returns OK.
=end
