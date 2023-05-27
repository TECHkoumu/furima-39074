class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :create]
  before_action :set_item, only: [:index, :create]
  before_action :check_not_owner, only: [:index]
  before_action :check_item_sold, only: [:index]
  def index
    @order_address = OrderAddress.new
  end

  def create
    price = @item.price
    @order_address = OrderAddress.new(order_params)

    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_address).permit(
      :postal_code, :prefecture_id, :city, :street, :building, :phone_number
    ).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def check_not_owner
    redirect_to root_path if @item.user_id == current_user.id
    # 現在のユーザーが出品者の場合、トップページにリダイレクト
  end

  def check_item_sold
    redirect_to root_path if @item.order.present?
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY'] # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price, # 値段
      card: order_params[:token], # トークン
      currency: 'jpy'                 # 通貨種類（日本円）
    )
  end
end
