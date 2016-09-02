require 'rails_helper'

RSpec.describe Properties do
  describe "properties" do
    it "get properties" do
      VCR.use_cassette("properties", record: :once ) do
        p = Properties.new
        properties = p.getProperties("51.52849","-0.08472800000004099")
        expect(properties["properties"].empty?).to eq(false)
      end
    end

    it "check properties format" do
      VCR.use_cassette("properties", record: :once ) do
        p = Properties.new
        properties = p.getProperties("51.52849","-0.08472800000004099")
        expect(properties["properties"].empty?).to eq(false)
        expect(properties["properties"][0]["uid"]).to eq('932V')
        expect(properties["properties"][0]["identifier"]).to eq(5969)
        expect(properties["properties"][0]["lat"]).to eq(51.49365)
        expect(properties["properties"][0]["lng"]).to eq(-0.103726)
        expect(properties["properties"][0]["rent"]).to eq(1795.0)
      end
    end

  end

end
