FactoryBot.define do
  factory :user do
    nickname              {'テストユーザー1'}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name            {'佐藤'}
    second_name           {'哲也'}
    first_name_kana       {'サトウ'}
    second_name_kana      {'テツヤ'}
    birth_day             {'1930-01-01'}
  end
end