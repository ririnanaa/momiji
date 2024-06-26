class Category < ApplicationRecord
  has_many :post_categories, dependent: :destroy
  has_many :posts, through: :post_categories, dependent: :destroy
  
  validates :name, uniqueness: true, length: { in: 1..30 }
  
end
