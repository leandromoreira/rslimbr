require File.dirname(__FILE__) + '/string_handler'

class StringListHandler
    def self.code(list)
        if list.is_a? Array
            stringed_items = "[" + StringHandler.string_prefix(list.size)
            list.each do |item|
               stringed_items += code(item) + ":"
            end
            stringed_items += "]"
            stringed_items = StringHandler.string_prefix(stringed_items.length) + stringed_items
        else
            StringHandler.code(list)
        end
    end
end
