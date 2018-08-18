module Core
  module V1
    module Entities
      class Url < Grape::Entity
        expose :path, documentation: { type: 'string', required: true }
        expose :short_path, documentation: { type: 'string', required: true }
        expose :full_new_url, if: { type: :full }, documentation: { type: 'string', required: true }
        expose :alternative_url, if: { type: :full }, documentation: { type: 'string', required: true }
        expose :clicks, documentation: { type: 'integer', required: true }

        def full_new_url
          "http://localhost:3000/api/v1/urls/#{object.short_path}"
        end

        def alternative_url
          "http://localhost:3000/#{object.short_path}"
        end
      end
    end
  end
end
