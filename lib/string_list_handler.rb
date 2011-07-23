require File.dirname(__FILE__) + '/string_handler'

class StringListHandler
    def self.encode(list)
        if list.is_a? Array
            stringed_items = "[" + StringHandler.string_prefix(list.size)
            list.each do |item|
               stringed_items += encode(item) + ":"
            end
            stringed_items += "]"
            stringed_items = StringHandler.string_prefix(stringed_items.length) + stringed_items
        else
            StringHandler.encode(list)
        end
    end
end
