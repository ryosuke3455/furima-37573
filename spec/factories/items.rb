FactoryBot.define do
  factory :item do
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    name               {'test'}
    explanation        {'text'}
    category_id        {'1'}
    quality_id         {'1'}
    delivery_charge_id {'1'}
    prefecture_id      {'1'}
    posting_id         {'1'}
    price              {'300'}
    
    association :user
  end
end