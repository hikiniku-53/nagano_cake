class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.page(params[:page])

  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      flash[:notice] = "変更が完了しました"
      redirect_to admin_customer_path(@customer.id)
    else
      render :edit
    end
  end



  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :telephone_number, :is_deleted)
  end


end
