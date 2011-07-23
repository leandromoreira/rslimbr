class StringHandler
    def self.encode(s)
        s = 'null' if s.nil?
        prefix = string_prefix s.length
        "#{prefix}#{s}"
    end
    
    def self.decode(s)
        s[7..-1]
    end

    def self.string_prefix(length)
        sprintf("%06d:",length)
    end
end
