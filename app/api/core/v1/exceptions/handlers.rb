module Core
  module V1
    module Exceptions
      module Handlers
        extend ActiveSupport::Concern

        included do
          rescue_from ActiveRecord::RecordNotFound do |e|
            error!({ error: {
              code: 1001,
              title: I18n.t('NOT_FOUND_TITLE'),
              message: I18n.t('NOT_FOUND_MESSAGE'),
              developer_error: e.message
            }.tap do |message|
              # Would add validation here via api auth/roles
              # so only admin/developer keys would see the devleoper error.
              # I don't think api auth is right for this project however.
              # The developer error is still important for debugging though.
              message[:backtrace] = e.backtrace
            end }, 404)
          end

          # Catch unexpected errors, fallback for everything else
          rescue_from :all do |e|
            error!({ error: {
              code: 1002,
              title: I18n.t('GENERIC_ERROR_TITLE'),
              message: I18n.t('GENERIC_ERROR_MESSAGE'),
              developer_error: e.message
            }.tap do |message|
              message[:backtrace] = e.backtrace
            end }, 500)
          end
        end
      end
    end
  end
end
