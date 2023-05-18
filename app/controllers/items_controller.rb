class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
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
      # 保存がうまくいかなくても入力済みデータを保持する
    end
  end

  def edit
  end

  def show
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :description, :category_id, :condition_id, :postage_id, :prefecture_id,
                                 :preparation_day_id, :price).merge(user_id: current_user.id)
  end
end
