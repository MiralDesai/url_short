module Core
  module V1
    module Entities
      class Url < Grape::Entity
        expose :path
        expose :short_path
      end
    end
  end
end
