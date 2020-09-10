FactoryBot.define do
  factory :user do
    email                { Faker::Internet.email }
    uid                  { Faker::Number.within(range: 100000..999999) }
    google_token         { Faker::Number.within(range: 100000..999999) }
    google_refresh_token { Faker::Number.within(range: 100000..999999) }
  end
  factory :omniauth_mock_user, parent: :user do
    email                {'john@example.com'}
    uid                  {'100000000000000000000'}
    google_token         {'MOCK_OMNIAUTH_GOOGLE_TOKEN'}
    google_refresh_token {'MOCK_OMNIAUTH_GOOGLE_REFRESH TOKEN'}
  end
end
