class OrderAddress

  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address_line, :building_name, :phone_number,:price, :user_id, :item_id

  with_options presence: true do
    validates :postal_code, presence: true, format: { with: /\A\d{3}-\d{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :prefecture_id, presence: true, numericality: { only_integer: true, greater_than: 0 }
    validates :city, :address_line, presence: true
    validates :phone_number, presence: true, format: { with: /\A\d{10,11}\z/, message: "is invalid. Input only number" }
    validates :item_id, presence: true, numericality: { only_integer: true }
    validates :user_id, presence: true, numericality: { only_integer: true }

  end




  def save
      order = Order.create(user_id:user_id, item_id:item_id)
      Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address_line: address_line, building_name: building_name, phone_number: phone_number, order_id:order.id)

    # 各テーブルにデータを保存する処理を書く
  end
end