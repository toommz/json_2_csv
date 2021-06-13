# frozen_string_literal: true

require "spec_helper"

RSpec.describe Json2Csv::Parser do
  let(:filepath) { File.expand_path("../fixtures/sample.json", __dir__) }

  subject { described_class }

  describe "#parse" do
    context "given a valid JSON string" do
      let(:data) { File.read(filepath) }

      it "returns headers" do
        headers, = subject.parse(data)

        expect(headers).to eq(["id", "email", "tags", "profiles.facebook.id", "profiles.facebook.picture",
                               "profiles.twitter.id", "profiles.twitter.picture"])
      end

      it "turns a list of hashes to a list of arrays" do
        _, lines = subject.parse(data)

        expect(lines).to be_an(Array)
        expect(lines.first).to be_an(Array)
      end
    end

    context "given an invalid JSON string containing no objects" do
      let(:data) { "[]" }

      it "raises a EmptyJsonError" do
        expect { subject.parse(data) }.to raise_error(Json2Csv::EmptyJsonError)
      end
    end

    context "given an invalid JSON string containing no array" do
      let(:data) { "{}" }

      it "raises a BadJsonInputError" do
        expect { subject.parse(data) }.to raise_error(Json2Csv::BadJsonInputError)
      end
    end
  end
end
