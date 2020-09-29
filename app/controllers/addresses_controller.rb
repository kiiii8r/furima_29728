class AddressesController < ApplicationController

  def index
    @address = Address.new
  end


  def create
    @address = Address.new(address_params)
    if @address.valid?
      pay_item
      @address.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def address_params
    params.permit(:price, :token)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: address_params[:price],  # 商品の値段
      card: address_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end

end
