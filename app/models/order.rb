class Order < ApplicationRecord
  belongs_to :item
  has_one :address
  has_one :order_address
end
