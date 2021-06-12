module Json2Csv
  module Parser
    def self.parse(json_string)
      data = JSON.parse(json_string)

      headers = Headers.parse(data.first)
      data.map { |object| Line.parse(object, headers) }
    end
  end
end
