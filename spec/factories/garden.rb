FactoryBot.define do
  factory :garden do
    user
    name      { Faker::JapaneseMedia::DragonBall.character }
    length_cm { rand(1..100) }
    width_cm  { rand(1..100) }
    zip_code  { 80111 }
    light     { rand(0..10) }
  end
end
