class Admin::HomesController < ApplicationController
  def top
    @orders = Order.all
    @total_amount = 0
  end

end
