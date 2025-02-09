class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_item, only: [:edit, :update, :show]
  before_action :authorize_user!, only: [:edit, :update]

  def index
    @items = Item.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
    @user = @item.user
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @item = Item.find(params[:id])

    params_to_update = item_params.to_h

    params_to_update.except!(:image) if params_to_update[:image].blank?

    if @item.update(params_to_update)
      redirect_to @item
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:image, :item_name, :item_information, :category_id, :condition_id, :shipping_cost_id,
                                 :prefecture_id, :shipping_day_id, :price).merge(user_id: current_user.id)
  end

  def authorize_user!
    return if @item.user == current_user

    redirect_to new_user_session_path
  end
end
