class Public::CustomersController < ApplicationController

  def show
    @customer = Customer.find(current_customer.id)
  end

  def update
  end

  def confirmation
  end

  def withdrawal
    @customer = Customer.find(current_customer.id)
    @customer.is_deleted = true
    @customer.save
    reset_session
    flash[:notice] = "退会が完了しました。"
    redirect_to root_path
  end



  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :telephone_number, :is_deleted)
  end



end
