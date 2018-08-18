class UrlController < ApplicationController
  def show
    @url = Url.find_by(short_path: params[:short_url])
    Url.increment_counter(:clicks, @url.id)
    redirect_to @url.path
  end
end
