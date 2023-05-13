class Item < ApplicationRecord
  has_one_attached :image

  has_many :order_details, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  belongs_to :genre

  def add_tax_price
    (self.price * Constants::Tax_rate).floor
  end



  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/default-image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end
end
