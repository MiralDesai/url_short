module Core
  module V1
    class Urls < Grape::API
      desc 'Get all urls and their shortened paths' do
        entity Core::V1::Entities::Url
      end
      get '/' do
        present :urls, Url.all, with: Entities::Url
      end
    end
  end
end
