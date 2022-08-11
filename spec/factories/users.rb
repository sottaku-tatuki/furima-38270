FactoryBot.define do
  factory :user do
    transient do
      gimei {Gimei.name}
    end

    nickname              {Faker::Name.initials}
    email                 {Faker::Internet.free_email}
    password              {('1a' + Faker::Internet.password(min_length: 4))}
    password_confirmation {password}
    family_name           {gimei.last.kanji}
    first_name            {gimei.first.kanji}
    family_name_kana      {gimei.last.katakana}
    first_name_kana       {gimei.first.katakana}
    birth_day             {Faker::Date.between(from: '1920-01-01', to: 90.years.ago)}
  end
end
