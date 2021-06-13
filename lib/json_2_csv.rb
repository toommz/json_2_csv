# frozen_string_literal: true

require "json"
require "csv"

require_relative "json_2_csv/version"
require_relative "json_2_csv/headers"
require_relative "json_2_csv/line"
require_relative "json_2_csv/parser"

module Json2Csv
  PATHNAME_SEPARATOR = "."
  COLUMN_SEPARATOR = ","
  ARRAY_TO_STRING_SEPARATOR = COLUMN_SEPARATOR

  class Error < StandardError; end

  class EmptyJsonError < Error; end

  class BadJsonInputError < Error; end

  def self.from_file(input_path, output_path)
    data = File.read(input_path)

    headers, csv_lines = Parser.parse(data)

    CSV.open(output_path, "w", headers: true, col_sep: COLUMN_SEPARATOR) do |csv|
      csv << headers
      csv_lines.each { |csv_line| csv << csv_line }
    end
  end
end
