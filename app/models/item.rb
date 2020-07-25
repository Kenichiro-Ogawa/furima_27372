class Item < ApplicationRecord
  belongs_to :user
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :delivery_time
  belongs_to_active_hash :prefecture

  validates :image, :name, :info, :category, :status, :delivery_fee, :prefecture, :delivery_time, :price, presence: true

  with_options numericality: { other_than: 1 } do
    validates :category_id, :status_id, :delivery_fee_id, :delivery_time_id, :prefecture_id
  end
end
