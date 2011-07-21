class String
    def to_snake_case
        self.gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
            gsub(/([a-z\d])([A-Z])/,'\1_\2').
            downcase
    end
end
module NamingConvention
    def to_ruby(string)
        raise Error.new("Can't convert null") if string.nil?
        snaked = string.to_snake_case
        if snaked.length > 3
            case snaked[0..3]
            when 'set_'
                return snaked[4..-1] + '='
            when 'get_'
                return snaked[4..-1]
            end
        end
        snaked
    end
end
