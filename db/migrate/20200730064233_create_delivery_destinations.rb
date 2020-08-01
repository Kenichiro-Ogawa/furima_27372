class CreateDeliveryDestinations < ActiveRecord::Migration[6.0]
  def change
    create_table :delivery_destinations do |t|
      t.references :purchase, null: false, foreign_key: true
      t.string :postal_code, null: false
      t.string :prefecture_id,  null: false
      t.string :city, null: false
      t.string :street, null: false
      t.string :building
      t.string :phone, null: false
      t.timestamps
    end
  end
end
