module Core
  module V1
    class Urls < Grape::API
      desc 'Get all urls and their shortened paths' do
        entity Core::V1::Entities::Url
      end
      get '/' do
        present :urls, Url.all, with: Entities::Url
      end

      desc 'Create a shortened URL' do
        entity Core::V1::Entities::Url
      end
      parmas do
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
