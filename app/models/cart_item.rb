class CartItem < ApplicationRecord

  belongs_to :item
  belongs_to :customer
  
  validates :amount, presence: true

  def add_tax_price
    (price * Constants::Tax_rate).floor
  end

  def subtotal
   item.add_tax_price * amount
  end


end
