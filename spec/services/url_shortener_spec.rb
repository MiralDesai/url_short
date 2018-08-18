require 'rails_helper'

RSpec.describe UrlShortener do
  describe 'when creating a new shortened url' do
    let(:url) { 'https://farmdrop.com/' }

    it 'returns a valid url object' do
      shortener = described_class.new(url: url)
      expect(shortener.shorten).to be_kind_of(Url)
    end

    it 'has a short_path between 1 and 10 characters' do
      shortener = described_class.new(url: url)
      url = shortener.shorten
      expect(url.short_path.length).to be_between(1, 10).inclusive
    end
  end
end
