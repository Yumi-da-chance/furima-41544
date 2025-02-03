class CreateShippingDays < ActiveRecord::Migration[7.1]
  def change
    create_table :shipping_days do |t|

      t.timestamps
    end
  end
end
