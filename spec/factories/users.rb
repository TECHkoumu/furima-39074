FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    nickname {Faker::Name.unique.name }
    email {Faker::Internet.free_email}
    password {"u8" + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name {person.first.kanji}
    last_name {person.last.kanji}
    first_name_kana {person.first.katakana}
    last_name_kana {person.last.katakana}
    birth_day { Faker::Date.between(from: Time.new(1930), to: 5.years.ago).to_date }
  end
end