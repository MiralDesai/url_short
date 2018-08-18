require 'active_record/errors'

module Core
  module V1
    class Urls < Grape::API
      desc 'Redirect short url to original url'
      params do
        requires :short_path, type: String, desc: 'The short url path'
      end
      get '/:short_path' do
        url = Url.find_by(short_path: params[:short_path])
        raise ActiveRecord::RecordNotFound unless url
        redirect url.path, permanent: true
      end

      desc 'Create a shortened URL' do
        entity Core::V1::Entities::Url
      end
      params do
        requires :url, type: String, desc: 'The url you want shortened'
      end
      post '/' do
        # # TODO: Does shortener already exist? Check here and automatically return
        url = Url.shorten(url: params[:url])
        present url, with: Entities::Url
      end
    end
  end
end
