FactoryBot.define do
  factory :garden do
    user
    name      { Faker::JapaneseMedia::DragonBall.character }
    length_cm { rand(1..100) }
    width_cm  { rand(1..100) }
    zip_code  { Faker::Address.zip_code }
    light     { rand(0..10) }
  end
end
