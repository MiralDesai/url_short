class Url < ApplicationRecord
  validates :path, uniqueness: { case_sensitive: false }
  validates :short_path, uniqueness: { case_sensitive: true }

  before_save :format_path

  # Force https because I feel it's expected these days
  def format_path
    uri = URI.parse(path)
    url.gsub!('http', 'https') if %w[http].include?(uri.scheme)
    url.prepend('https://') unless uri.scheme
  end
end
