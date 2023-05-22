class Admin::HomesController < ApplicationController
  def top
    @orders = Order.page(params[:page])
    @total_amount = 0
  end

end
