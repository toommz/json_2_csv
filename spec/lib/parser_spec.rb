require "spec_helper"

RSpec.describe Json2Csv::Parser do
  let(:filepath) { File.expand_path("../../fixtures/sample.json", __FILE__) }

  subject { described_class }

  describe "#parse" do
    let(:data) { File.read(filepath) }

    it "turns a list of hashes to a list of arrays" do
      result = subject.parse(data)

      expect(result).to be_an(Array)
      expect(result.first).to be_an(Array)
    end
  end
end
