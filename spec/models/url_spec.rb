require 'rails_helper'

RSpec.describe Url, type: :model do
  describe 'when shorting a url' do
    it 'does not create a shortened url if the url is invalid' do
      expect do
        described_class.shorten(url: 'foobar')
      end.to raise_error(Core::V1::Exceptions::InvalidUrlError)
    end

    context 'with valid data' do
      it 'creates a valid url object' do
        expect(described_class.shorten(url: 'www.google.co.uk')).to be_kind_of(Url)
      end
    end
  end

  describe 'when attempting to format a path' do
    let(:url_path) { 'google.co.uk' }
    it 'calls the #format_path method in the UrlShortener class' do
      expect(UrlShortener).to receive(:format_path).with(path: url_path).once
      described_class.format_path(url: url_path)
    end
  end

  describe 'when creating a new url' do
    context 'without a short_url' do
      let(:invalid_url) { FactoryBot.build(:url, short_path: nil) }
      it 'should not be valid' do
        expect(invalid_url).not_to be_valid
      end
    end

    context 'without a path' do
      let(:no_path_url) { FactoryBot.build(:url, path: nil) }
      it 'should not be valid' do
        expect(no_path_url).not_to be_valid
      end
    end

    context 'when a url already exists' do
      let(:url_path) { 'farmdrop.com' }
      before do
        Url.create(path: url_path, short_path: '/gogl')
      end
      it 'does not create a new url' do
        expect(Url.create(path: url_path, short_path: '/google')).not_to be_valid
      end
    end

    context 'when an all capitals short_path already exists' do
      let(:short_path) { '/FARM' }
      before do
        Url.create(path: 'google.com', short_path: short_path)
      end
      it 'creates the url object' do
        expect(Url.create(path: 'facebook.com', short_path: '/farm')).to be_valid
      end
    end
  end
end
