class PurchaseDeliveryDestination
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :street, :building, :phone

  with_options presense: true do
    validates :city, :steet
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :phone, format: { with: /\A\d{10}$|^\d{11}\z/ }
  end

  validates :prefecture_id, numericality: { other_than: 1 }

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    DeliveryDestination.create( purchase_id: purchase.id,
                                postal_code: postal_code,
                                prefecture_id: prefecture_id,
                                city: city,
                                street: street,
                                building: building,
                                phone: phone,
                              )
  end

end