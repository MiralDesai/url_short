module Core
  module V1
    module Entities
      class Url < Grape::Entity
        expose :path
        expose :short_path
        # expose :full_new_url

        def full_new_url
          "http://localhost:3000#{object.short_path}"
        end
      end
    end
  end
end
