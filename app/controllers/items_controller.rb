class ItemsController < ApplicationController
  def index
    # 必要に応じてロジックを追加
  end

  private

  def item_params
    params.require(:item).permit(:content, :image).merge(user_id: current_user.id)
  end

end
