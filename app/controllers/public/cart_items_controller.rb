class Public::CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items
    @total_price = 0
  end

  def create
    cart_item = current_customer.cart_items.find_by(item_id: cart_item_params[:item_id])
    if cart_item
      amount = cart_item_params[:amount].to_i
      cart_item.amount = amount += cart_item.amount
      cart_item.update(amount: cart_item.amount)
    else
      @cart_item = CartItem.new(cart_item_params)
      @cart_item.customer_id = current_customer.id
      @cart_item.save
    end
    flash[:notice] = "カートに商品を追加しました"
    redirect_to cart_items_path
  end

  def edit

  end

  def update
    cart_item = CartItem.find(params[:id])
    cart_item.update(cart_item_params)
    flash[:notice] = "数量を変更しました"
    redirect_to cart_items_path
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to cart_items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :customer_id, :amount)
  end

end
