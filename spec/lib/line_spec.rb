# frozen_string_literal: true

require "spec_helper"

RSpec.describe Json2Csv::Line do
  let(:headers) { ["id", "email", "tags", "profiles.facebook.id", "profiles.facebook.picture"] }

  describe "#parse" do
    subject { described_class.new(object, headers) }

    context "given a hash that has all the intended keys" do
      let(:object) do
        Hash["id" => 0, "email" => "a@b.c", "tags" => %w[ok ko],
             "profiles" => { "facebook" => { "id" => 0, "picture" => "img.jpg" } }]
      end

      it "returns a line of CSV" do
        expect(subject.parse).to eq([0, "a@b.c", "ok,ko", 0, "img.jpg"])
      end
    end

    context "given a hash missing some keys" do
      let(:object) { Hash["id" => 0, "profiles" => 0] }

      it "handles exceptions" do
        expect { subject.parse }.not_to raise_error
      end
    end
  end
end
