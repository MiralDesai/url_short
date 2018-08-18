# Heart of URL shortener logic can live here, prefer not to have it in the model
# Also makes this quite extendable and could be dropped into any application
class UrlShortener
  def initialize(url:)
    @url = url
  end

  def shorten
    # TODO: Shorten the url with some amazing logic
    # return valid url object
  end
end
