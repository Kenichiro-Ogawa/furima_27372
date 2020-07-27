class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.string :info, null: false
      t.string :category_id, null: false
      t.string :status_id, null: false
      t.string :delivery_fee_id, null: false
      t.string :prefecture_id, null: false
      t.string :delivery_time_id, null: false
      t.integer :price, null: false
      t.timestamps
    end
  end
end
