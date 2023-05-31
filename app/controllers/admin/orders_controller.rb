class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])

  end

  def customer_search
    @customer = Customer.find(params[:id])
    @orders = @customer.orders.page(params[:page])
    @total_amount = 0
  end

  def update
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: params[:id])

    if @order.update(order_params)
      @order_details.update_all(making_status: 1) if @order.status == 'deposit_confirmation'
    end

    flash[:notice] = "ステータスが更新されました"
    redirect_to admin_order_path
  end

  private

  def order_params
    params.require(:order).permit(:status)
  end
end
