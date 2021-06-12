module Json2Csv
  class Headers
    def initialize(object)
      @object = object
    end

    class << self
      def parse(object)
        self.new(object).parse
      end
    end

    def parse
      parse_object(object).flatten
    end
  
    private

    attr_reader :object

    def parse_object(hash, pathname = nil)
      hash.map do |key, value|
        next parse_object(value, pathname_for(key, pathname)) if value.is_a?(Hash)

        pathname_for(key, pathname)
      end
    end
  
    def pathname_for(key, pathname)
      return key if pathname.nil?

      "#{pathname}#{PATHNAME_SEPARATOR}#{key}"
    end
  end
end
