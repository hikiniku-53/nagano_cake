class OrderDetail < ApplicationRecord

  belongs_to :order
  belongs_to :iten

  enum making_status: { cannot_be_started: 0, awaiting_manufacture: 1, under_manufacture: 2, manufacturing_completed: 3 }

end
