class PurchasesController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:item_id])
  end

  def create
    # @item = Item.find(params[:item_id])
    @purchase = Purchase.new
    binding.pry
    if @purchase.valid?
      pay_item
      @purchase.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

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

end
