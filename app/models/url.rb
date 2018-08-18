class Url < ApplicationRecord
  validates :path, uniqueness: { case_sensitive: false }
  validates :short_path, uniqueness: { case_sensitive: true }
  validates :path, presence: true
  validates :short_path, presence: true

  # Validating a URL is a bit of a mess so skipping it
  # Instead deciding to ping the entered url and only shorten valid sites
  def self.shorten(url:)
    raise ::Core::V1::Exceptions::InvalidUrlError unless valid_url?(url)
    UrlShortener.new(url: url).shorten
  end

  def self.format_path(url:)
    UrlShortener.format_path(path: url)
  end

  private

  def self.valid_url?(url)
    check = Net::Ping::External.new(url)
    check.ping?
  end
end
