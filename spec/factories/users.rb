FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'aaaaa1'}
    password_confirmation {password}
    last_name             {'試験'}
    first_name            {'試験'}
    last_name_kana        {'テスト'}
    first_name_kana       {'テスト'}
    birthday              {'2000-01-01'}
  end
end