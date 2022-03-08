FactoryBot.define do
  factory :order_form do
    post_code     {'123-4567'}
    prefecture_id {'1'}
    city          {'Fukuoka-si'}
    address       {'1-1-1'}
    building      {'AAbuilding101'}
    phone         {'09011111111'}
    token {'tok_abcdefghijk00000000000000000'}
  end
end
