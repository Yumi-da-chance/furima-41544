class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]


  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
    redirect_to '/'
  end

  private

  def item_params
    params.require(:item).permit(:content, :image).merge(user_id: current_user.id)
  end

end
