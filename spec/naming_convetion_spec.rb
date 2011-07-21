#specs from http://fitnesse.org/FitNesse.UserGuide.SliM.SlimProtocol
require File.dirname(__FILE__) + '/../lib/naming_convention'

describe NamingConvention do
    include NamingConvention
    describe "Method naming convention" do
        it "given the read property 'name' should return 'name'" do
            test = to_ruby('name')
            test.should == 'name'
        end
        it "given the read property 'formattedName' should return 'formatted_name'" do
            test = to_ruby('formattedName')
            test.should == 'formatted_name'
        end
        it "given the write property 'setSurname' should return 'surname='" do
            test = to_ruby('setSurname')
            test.should == 'surname='
        end
        it "given the write property 'setUserName' should return 'user_name='" do
            test = to_ruby('setUserName')
            test.should == 'user_name='
        end
        it "given the read property 'getUserName' should return 'user_name'" do
            test = to_ruby('getUserName')
            test.should == 'user_name'
        end
    end
end
