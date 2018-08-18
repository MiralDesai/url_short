module Core
  class ApiV1 < Grape::API
    format :json
    include V1::Exceptions::Handlers

    # TODO: Basic api auth here? Do we even need api authentication?

    version 'v1', using: :path, desc: 'All V1 APIs' do
      # Mount all V1 APIs here
      namespace 'urls', desc: 'Url API', nested: true do
        mount V1::Urls
      end
    end

    add_swagger_documentation(
      api_version: 'v1',
      doc_version: '0.0.1',
      info: {
        title: 'Url Short - A simple URL shortner by Miral Desai',
        description: %(
          This is the alpha Url Short API. All available routes are documented here.
          Any new endpoints will be added as they become available for consumption.
          Please check back as often as possible for updates.
        ),
        license: 'Property of the world!',
        license_url: 'https://www.farmdrop.com',
        terms_of_service_url: 'https://www.farmdrop.com'
      }
    )
  end
end
