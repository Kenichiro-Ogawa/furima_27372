class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :delivery_time
  belongs_to_active_hash :prefecture

  validates :image, :name, :info, presence: true
  validates :price, presence: true

  with_options numericality: { other_than: 1 } do
    validates :category_id, :status_id, :delivery_fee_id, :delivery_time_id, :prefecture_id
  end
end
