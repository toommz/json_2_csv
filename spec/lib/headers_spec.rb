# frozen_string_literal: true

require "spec_helper"

RSpec.describe Json2Csv::Headers do
  let(:object) do
    Hash["id" => 0, "email" => "a@b.c", "tags" => [],
         "profiles" => { "facebook" => { "id" => 0, "picture" => "img.jpg" } }]
  end

  describe ".parse" do
    let(:double) { instance_double(described_class) }

    before { expect(described_class).to receive(:new).and_return(double) }

    it "delegates to the instance methode #parse" do
      expect(double).to receive(:parse)

      described_class.parse(object)
    end
  end

  describe "#parse" do
    subject { described_class.new(object) }

    it "returns the CSV headers with the right paths" do
      expect(subject.parse).to eq(["id", "email", "tags", "profiles.facebook.id", "profiles.facebook.picture"])
    end
  end
end
