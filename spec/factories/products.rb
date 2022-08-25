FactoryBot.define do
  factory :product do
    item_name      {'test'}
    price          {'500'}
    association :user
    after(:build) do |product|
      product.image.attach(io: File.open('public/images/work-shop.jpg'), filename: 'work-shop.jpg')
    end
  
    info           {'説明'}
    category_id    {'2'}
    situation_id   {'2'}
    cost_id        {'2'}
    area_id        {'2'}
    day_id         {'2'}

  end
end
