class PurchaseDeliveryDestination
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :street, :building, :phone

  validates :prefecture_id, numericality: { other_than: 1 }

  def save
    purchase = Purchase.create(user_id: current_user.id, item_id: @item.id)
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