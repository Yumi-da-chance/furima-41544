FactoryBot.define do
  factory :user do
    nickname                             { Faker::Name.initials(number: 2) }
    email                                { Faker::Internet.email }
    password                             { Faker::Internet.password(min_length: 6) }
    password_confirmation                { password }
    family_name                          { '小林' }
    family_name_kana                     { 'コバヤシ' }
    first_name                           { '由美' }
    first_name_kana                      { 'ユミ' }
    birth_date                           { '1990-11-11' }
  end
end
