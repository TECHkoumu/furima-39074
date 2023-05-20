class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit]
  before_action :set_item_find, only: [:edit, :update, :show]
  before_action :check_item_owner, only: [:edit, :update]
  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
      # 保存がうまくいかない場合、入力済みデータを保持して登録ページを再表示する
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
      # 更新がうまくいかない場合、入力データを保持して編集ページを再表示する
    end
  end

  def show
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :description, :category_id, :condition_id, :postage_id, :prefecture_id,
                                 :preparation_day_id, :price).merge(user_id: current_user.id)
  end

  def set_item_find
    @item = Item.find(params[:id])
  end

  def check_item_owner
    return if @item.user_id == current_user.id

    # 編集対象商品の出品者IDとログインユーザーのIDを比較
    redirect_to root_path
    # 出品者以外の場合、トップページに戻す
  end
end
