# frozen_string_literal: true

require "json"

require_relative "json_2_csv/version"
require_relative "json_2_csv/headers"
require_relative "json_2_csv/line"
require_relative "json_2_csv/parser"

module Json2Csv
  PATHNAME_SEPARATOR = ".".freeze
  COLUMN_SEPARATOR = ",".freeze
  ARRAY_TO_STRING_SEPARATOR = COLUMN_SEPARATOR

  class Error < StandardError; end
end
