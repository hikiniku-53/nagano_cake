class CartItem < ApplicationRecord

  def total_price
    item = Item.find(self.item_id)
    self.amount * item.add_tax_price
  end



end
