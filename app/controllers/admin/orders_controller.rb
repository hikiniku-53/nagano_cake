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
    @order.update(order_params)
    flash[:notice] = "注文ステータスが更新されました"
    redirect_to admin_order_path
  end

  private

  def order_params
    params.require(:order).permit(:status)
  end

end
