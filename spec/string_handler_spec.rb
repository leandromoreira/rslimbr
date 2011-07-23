require File.dirname(__FILE__) + '/../lib/string_handler'

describe StringHandler do
    before do
        @long_string = "This is a extremely long string just to test the correct zero padding in the final string. Does this string have a length of more than 3 digits? Probably not, so I'll just type a little more. Maybe I'll write you a poem. Roses are red, violets are blue. Osame Bin Laden is dead. Great. I think that'll do."
    end
    describe "Slim string encoding" do
        it "should put the 000000: before the string" do
            StringHandler.encode('test').should == '000004:test'
            StringHandler.encode(@long_string).should == "000305:#{@long_string}"
        end
    end

    describe "Slim string decoding" do
        it "should return just the string, without the prefix" do
            StringHandler.decode('000004:test').should == 'test'
            StringHandler.decode("000305:#{@long_string}").should == @long_string
        end
    end
end
