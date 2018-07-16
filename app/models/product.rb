class Product < ActiveRecord::Base
  validates :description, :name, presence: true
  validates :price_in_cents, numericality: {only_integer: true, greater_than: 0}
  has_many :reviews
  has_attached_file :image, styles: { large: "600x600", medium: "300x300>", thumb: "150x150#" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  validates :description, length: {maximum: 1000, too_long: "%{count} characters is the maximum allowed. "}

  SIZE = %W{XS S M L XL}
  COLOR = %W{ Black White Grey Orange Purple Blue Yellow Multi }

  def formatted_price
   price_in_dollars = price_in_cents.to_f / 100
   format("%.2f", price_in_dollars)
 end
end
