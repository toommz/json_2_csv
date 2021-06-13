module Json2Csv
  class Line
    def initialize(object, headers)
      @object = object
      @headers = headers
    end
    
    class << self
      def parse(object, headers)
        self.new(object, headers).parse
      end
    end

    def parse
      headers.map do |header|
        fetch(header.split(PATHNAME_SEPARATOR))
      end
    end

    private

    attr_accessor :object, :headers

    def fetch(dig_map)
      value = object.dig(*dig_map)
      return array_values(value) if value.is_a?(Array)
        
      value
    rescue TypeError, NoMethodError
      nil
    end

    def array_values(value)
      value.join(ARRAY_TO_STRING_SEPARATOR)
    end
  end
end
