#specs from http://fitnesse.org/FitNesse.UserGuide.SliM.SlimProtocol
require File.dirname(__FILE__) + '/../lib/instructions/make'
require File.dirname(__FILE__) + '/../lib/instructions/import'

describe Make do
	before(:all) do
		@import = Import.new "id0"
		@import.add "Fixtures"
		@make = Make.new(@import.imports)
	end
	describe "Instruction" do
		it "should create an instance of Zoo" do
			@make.build("instance00", "Zoo").should == "OK"
		end
		it "should keep an instance of String, with \"test\" as arg, at instance01 key" do
			@make.build("instance01", "String",["test"]).should == "OK"
		end
		it "should keep an instance of Foo with two args" do
			@make.build("instance02", "Foo",["one","two"]).should == "OK"
		end
		it "should look at import to create object" do
			@make.build("instance03", "Any").should == "OK"
		end
	end
end

class Zoo
end

class Foo
	attr_accessor :one, :two
	def initialize(one,two)
		@one = one
		@two = two
  end
end

module Fixtures
  class Any
  end
end

=begin
Make: [<id>, make, <instance>, <class>, <arg>...] 

This instruction causes slim to search for a class named <class> in the imported search paths. 
<class> can also be fully qualified. 
If found slim looks for a constructor with the right number of arguments. 
If found, the <arg> strings are converted to the appropriate types, and the constructor is called.
The newly create instance is registered under the name <instance>, and the instruction returns OK.
=end
