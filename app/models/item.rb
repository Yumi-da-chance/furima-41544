class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  belongs_to :condition
  belongs_to :shipping_cost

  

  belongs_to :user
  has_one :record
  has_one_attached :image

  validates :image, presence: true
  validates :item_name, presence: true
  validates :item_information, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :shipping_cost_id, presence: true
  validates :prefecture_id, presence: true
  validates :shipping_day_id, presence: true
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }




  validates :genre_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :condition_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :shipping_cost_id, numericality: { other_than: 1 , message: "can't be blank"}

end
