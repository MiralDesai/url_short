module Core
  module V1
    module Entities
      class Url < Grape::Entity
        expose :path
        expose :short_path
        expose :full_new_url, if: { type: :full }
        expose :alternative_url, if: { type: :full }

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
