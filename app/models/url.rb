class Url < ApplicationRecord
  validates :path, uniqueness: { case_sensitive: false }
  validates :short_path, uniqueness: { case_sensitive: true }

  before_save :format_path

  def shorten(url:)
    # TODO: Validate url or raise error
    url = UrlShortener.new(url: url).shorten
  end

  private

  def format_path
    path.strip! # Remove spaces
    path.chomp!('/') # Remove trailing slash
    self.path = httpsify_path(path)
  end

  # Force https because I feel it's expected these days
  def httpsify_path(path)
    uri = URI.parse(path)
    url.gsub!('http', 'https') if %w[http].include?(uri.scheme)
    url.prepend('https://') unless uri.scheme
  end
end
