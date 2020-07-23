class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :image, null: false
      t.string :name, null: false
      t.string :info, null: false
      t.string :category, null: false
      t.string :status, null: false
      t.integer :price, null: false
      t.string :delivery_fee, null: false
      t.string :prefecture, null: false
      t.string :delivery_time, null: false
      t.timestamps
    end
  end
end
