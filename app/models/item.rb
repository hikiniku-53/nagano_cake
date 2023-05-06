class Item < ApplicationRecord
  has_one_attached :image

  def add_tax_price
    tax_rate = 1.10
    (self.price * tax_rate).round
  end

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/default-image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end
end
