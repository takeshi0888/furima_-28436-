FactoryBot.define do
  factory :user do
    nickname              { 'あべ' }
    email                 { 'kkk@gmail.com' }
    password              { 'aaa000000' }
    password_confirmation { password }
    family_name           { '山田' }
    first_name            { '太郎' }
    family_name_kana      { 'ヤマダ' }
    first_name_kana       { 'タロウ' }
    date_of_birth         { '1990-09-09' }
  end
end
