class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create, :pay_item]

  def index
  end

  def create
    @purchase = PurchaseDeliveryDestination.new(purchase_params)
    if @purchase.valid?
      pay_item
      @purchase.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end


  def order_params
    params.permit(:token)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency:'jpy'
    )
  end

  def purchase_params
    params.permit(:item_id, :postal_code, :prefecture_id, :city, :street, :building, :phone)
  end
end
