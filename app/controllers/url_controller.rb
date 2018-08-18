class UrlController < ApplicationController
  def show
    @url = Url.find_by(short_path: params[:short_url])
    redirect_to @url.path
  end
end
