FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    password { 'password' }
    password_confirmation { 'password' }

    trait :with_avatar do
      after(:build) do |user|
        user.avatar.attach(
          io: File.open(Rails.root.join('spec', 'fixtures', 'files', 'avatar.png')),
          filename: 'avatar.png',
          content_type: 'image/png'
        )
      end
    end

    trait :admin do
      after(:create) do |user|
        user.add_role(:admin)
      end
    end

    trait :with_posts do
      after(:create) do |user|
        create_list(:post, 3, user: user)
      end
    end
  end
end
