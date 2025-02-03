FactoryBot.define do
  factory :item do

    item_name                             { 'あああ' }
    item_information                      { 'あああ'}
    price                                 { '1000' }

    association :user
    association :category
    association :condition
    association :shipping_cost
    association :prefecture
    association :shipping_day

    after(:build) do |item|
      item.image.attach(
        io: File.open(Rails.root.join('spec', 'fixtures', 'files', 'test_image.png')), filename: 'test_image.png', content_type: 'image/png')


  
    end
  end
end