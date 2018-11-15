class Product < ApplicationRecord

  validates :name, presence: true
  validates :description, presence: true
  validates :image_url, presence: true, format: {with: /\.(png|jpg|jpeg|tif|tiff|bmp|gif|eps)\Z/i, message: "as does not end in image format"}
  validates :colour, presence: true
  validates :price, presence: true, format: { with: /\A\d+(?:\.\d{0,2})?\z/ }, numericality: { greater_than: 0, less_than: 1000000 }


  has_many :orders
  has_many :comments
  accepts_nested_attributes_for :comments
  validates_associated :comments


  def self.search(search_term)
    if Rails.env.development?
      Product.where("name LIKE ?", "%#{search_term}%")
    else
      Product.where("name ilike ?", "%#{search_term}%")
    end
  end

  def highest_rating_comment
    comments.rating_desc.first
  end

  def lowest_rating_comment
    comments.rating_asc.first
  end

  def average_rating
  comments.average(:rating).to_f
  end
end
