FactoryBot.define do
  factory :item do
    image { Rack::Test::UploadedFile.new(Rails.root.join('public/images/the_world.png'), 'image/png') }
    name { Faker::Name.name }
    description { Faker::Lorem.paragraph }
    category { Category.where.not(id: 1).sample || association(:category) }
    condition { Condition.where.not(id: 1).sample || association(:condition) }
    postage { Postage.where.not(id: 1).sample || association(:postage) }
    prefecture { Prefecture.where.not(id: 0).sample || association(:prefecture) }
    preparation_day { PreparationDay.where.not(id: 1).sample || association(:preparation_day) }
    price { Faker::Number.between(from: 300, to: 9_999_999) }
    association :user
  end
end
