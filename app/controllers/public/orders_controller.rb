class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def confirmation
    @cart_items = current_customer.cart_items
    @order = Order.new(order_params)
    @total_price = 0

    if params[:order][:select_address].to_i == 0
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name

    elsif params[:order][:select_address].to_i == 1
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name

    elsif params[:order][:select_address].to_i == 2

    end
  end

  def completion
  end

  def create
  end

  def index
  end

  def show
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name)
  end

end