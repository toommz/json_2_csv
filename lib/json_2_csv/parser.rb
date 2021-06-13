module Json2Csv
  module Parser
    def self.parse(json_string)
      data = JSON.parse(json_string)

      raise BadJsonInputError.new("Please provide a JSON array of objects") if data.is_a?(Hash)
      raise EmptyJsonError.new("Please provide a JSON file containing some data") if data.empty?

      headers = Headers.parse(data.first)

      [headers, data.map { |object| Line.parse(object, headers) }]
    end
  end
end
