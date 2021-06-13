# frozen_string_literal: true

RSpec.describe Json2Csv do
  it "has a version number" do
    expect(Json2Csv::VERSION).not_to be nil
  end

  describe ".from_file" do
    let(:filepath) { File.expand_path("../fixtures/sample.json", __FILE__) }
    let(:expected_output_filepath) { File.expand_path("../fixtures/sample_output.csv", __FILE__) }
    let(:output_filepath) { File.expand_path("../../tmp/output.csv", __FILE__) }

    let(:expected_output) { File.read(expected_output_filepath) }

    it "returns a CSV file" do
      described_class.from_file(filepath, output_filepath)

      expect(File.read(output_filepath)).to eq(expected_output)
    end
  end
end
