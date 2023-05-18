class Admin::OrderDetailsController < ApplicationController
  def update
  end



  private

  def order_detail_params
    params.require(:order_detail).permit(:order_id, :item_id, :amount, :price)
  end

end
