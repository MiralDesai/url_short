FactoryBot.define do
  factory :url do
    path { Faker::Internet.domain_name }
    short_path { '/' + Faker::Internet.domain_suffix }
  end
end
