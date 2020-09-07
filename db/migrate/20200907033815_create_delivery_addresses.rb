class CreateDeliveryAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :delivery_addresses do |t|
      t.string :postal_code, null: false
      t.integer :prefecture_id, null: false
      t.string :address1, null: false
      t.string :address2, null: false
      t.string :building_name, null: false
      t.integer :phone_number, null: false
      t.references :order, foreign_key: true
      t.timestamps
    end
  end
end
