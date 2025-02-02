class CreateShippingCosts < ActiveRecord::Migration[7.1]
  def change
    create_table :shipping_costs do |t|

      t.timestamps
    end
  end
end
