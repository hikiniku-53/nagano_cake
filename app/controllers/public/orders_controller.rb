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
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save

    current_customer.cart_items.each do |cart_item|
      @order_detail = OrderDetail.new
      @order_detail.order_id = @order.id

      @order_detail.item_id = cart_item.item_id
      @order_detail.amount = cart_item.amount
      @order_detail.price = cart_item.item.add_tax_price

      @order_detail.save!

    end


    current_customer.cart_items.destroy_all

    redirect_to order_completion_path
  end

  def index
    @orders = current_customer.orders

  end

  def show
    @order = Order.find(params[:id])
    
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name, :shipping_cost, :total_payment)
  end

end