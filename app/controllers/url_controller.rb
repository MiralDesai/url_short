class UrlController < ApplicationController
  def show
    @url = Url.find_by(short_path: params[:short_url])
    Url.increment_counter(:clicks, @url.id)
    redirect_to @url.path
  end

  def index
    @urls = Url.all
  end

  def new
    @url = Url.new
  end

  def create
    @url = Url.shorten(url: url_params[:path])
    if @url.save
      redirect_to url_index_path, notice: 'Url created'
    else
      render new_url_path, alert: 'Error creating url'
    end
  end

  def destroy
    Url.find(params[:id]).destroy
    flash[:success] = 'Url deleted'
    redirect_to url_index_path
  end

  private

  def url_params
    params.require(:url).permit(:path)
  end
end
