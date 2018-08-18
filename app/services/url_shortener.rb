# Heart of URL shortener logic can live here, prefer not to have it in the model
# Also makes this quite extendable and could be dropped into any application
class UrlShortener
  def initialize(url:)
    @url = url
  end

  def shorten
    # Not sure I like calling the class again... but for now it works.
    Url.create(path: UrlShortener.format_path(path: url), short_path: create_short_path)
  end

  private

  # Using the characters in the url to create the short version
  # This would be a limiting factor in a production app
  # Just using the first idea that came to me for now
  def create_short_path
    chars = url.gsub(%r{[.\/:#]}, '').split('')
    '/' + Array.new(rand(1..10)).map { chars.sample }.join
  end

  def self.format_path(path:)
    path = path.strip # Remove spaces
    path = path.chomp('/') # Remove trailing slash
    httpsify_path(path)
  end

  # Force https because I feel it's expected these days
  def self.httpsify_path(path)
    uri = URI.parse(path)
    path.gsub!('http', 'https') if %w[http].include?(uri.scheme)
    path.prepend('https://') unless uri.scheme
  end

  attr_reader :url
end
