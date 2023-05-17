class Order < ApplicationRecord

  has_many :order_details, dependent: :destroy
  belongs_to :customer

  enum payment_method: { credit_card: 0, transfer: 1 }

  enum status: { unpaid: 0, deposit_confirmation: 1, production: 2, preparation: 3, shipped: 4 }

  def address_display
    '〒' + postal_code + ' ' + address + ' ' + name
  end

end