FactoryBot.define do
  factory :item do
    name                {Gimei.unique.name.kanji}
    instructions        {'あああああああ'}
    price               {1000}
    association :user
    deliveryaddress_id  {1}
    category_id         {2}
    quality_id          {2}
    deliverycharg_id    {2}
    deliveryday_id      {3}



    after(:build) do |item|
      item.image.attach(io: File.open('public/images/テスト画像.png'), filename: 'test_image.png')
    end
  end
end