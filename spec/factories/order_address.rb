FactoryBot.define do
  factory :order_address do
    postal_code                  { '123-4567' }
    prefecture_id                { 1 }
    city                         { 'あ' }
    address_line                 { 'ああ' }
    building_name                { 'あああ' }
    phone_number                 { '08081166079' }
    item_id                      { nil }
    user_id                      { nil }
    token                        { 'tok_abcdefghijk00000000000000000' }
  end
end
