class Admin::OrderDetailsController < ApplicationController
  def update
    @order_detail = OrderDetail.find(params[:id])
    @order_detail.update(order_detail_params)
    flash[:notice] = "製作ステータスが更新されました"
    redirect_to admin_order_path(@order_detail.order_id)
  end



  private

  def order_detail_params
    params.require(:order_detail).permit(:order_id, :item_id, :amount, :price, :making_status)
  end

end
