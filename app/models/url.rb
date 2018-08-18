class Url < ApplicationRecord
  validates :path, uniqueness: { case_sensitive: false }
  validates :short_path, uniqueness: { case_sensitive: false }
end
