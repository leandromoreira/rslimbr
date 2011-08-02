#specs from http://fitnesse.org/FitNesse.UserGuide.SliM.SlimProtocol
require File.dirname(__FILE__) + '/../lib/instructions/call'
require File.dirname(__FILE__) + '/../lib/instructions/make'

describe "Call and assign" do
		before(:each) do
			@make = Make.new
			@make.build("instance0", "String","test")
			@call = Call.new @make.instances
		end
		it "should keep the return value to the symbol" do
			@call.call_and_assign "symbol","instance0","sum"
			@call.symbols["symbol"].should == 448
		end
		it "shoud call index('s') and assign it to symbol0" do
			@call.call_and_assign "symbol0","instance0","index",['s']
			@call.symbols["symbol0"].should.should == 2
		end
end


=begin
CallAndAssign: [<id>, callAndAssign, <symbol>, <instance>, <function>, <arg>...] 
This instruction is identical to call except that the return value is saved in a symbol named <symbol>. 
That symbol is kept in a dictionary in the SLIM system. 
Symbol names may only contain letters
=end
