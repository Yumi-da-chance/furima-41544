class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.string      :item_name,               null: false
      t.text        :item_information,        null: false
      t.references  :user,                    null: false, foreign_key: true
      t.integer     :category_id,             null: false
      t.integer     :condition_id,            null: false
      t.integer     :shipping_cost_id,        null: false
      t.integer     :prefecture_id,           null: false
      t.integer     :shipping_day_id,         null: false
      t.integer     :price,                   null: false
      t.boolean     :sold, default: false,    null: false
      t.timestamps
    end
  end
end
