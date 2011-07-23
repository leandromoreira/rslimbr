require File.dirname(__FILE__) + '/../lib/string_list_handler'

=begin
A list is encoded as a string that begins with a '[', followed by a <length> specifying the number of items in the list. This is followed by that many strings, each terminated by a colon, and then finally a ']' Thus, this list: [hello,world] is encoded as the following string:

000035:[000002:000005:hello:000005:world:]

Take careful note of all the colons and counts. Colons are terminators not separators.

As you can see, each item of a list is a string. But since a string can encode a list, each item of a list can be another list. So we can have very deep recursive definitions.

=end
describe StringListHandler do
    before do
        @list = ['hello', 'world']
        @stringed_list = "000035:[000002:000005:hello:000005:world:]"
    end
    describe "Slim string list coding" do
        it "can code a simple list" do
            StringListHandler.code(@list).should == @stringed_list
        end

        it "can encode a nested list" do
            StringListHandler.code([["element"]]).should == "000041:[000001:000024:[000001:000007:element:]:]"
        end

        it "can encode empty lists" do
            StringListHandler.code([]).should == "000009:[000000:]"
        end
        
        it "can encode null items" do
            StringListHandler.code([nil]).should == "000021:[000001:000004:null:]"
        end
    end

    describe "Slim string list decoding" do
        pending
    end
end
