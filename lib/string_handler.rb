class StringHandler
    def self.code(s)
        prefix = string_prefix s.length
        "#{prefix}:#{s}"
    end
    
    def self.decode(s)
        s[7..-1]
    end

    private
    def self.string_prefix(length)
        sprintf("%06d",length)
    end
end
