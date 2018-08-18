Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/:short_url', to: 'url#show'

  mount Core::ApiV1 => '/api'
  mount GrapeSwaggerRails::Engine => '/api/docs'
end
