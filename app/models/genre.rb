class Genre < ApplicationRecord
  has_many :post_genres, dependent: :destroy
  has_many :posts, through: :post_genres, dependent: :destroy
  
  validates :name, uniqueness: true, length: { in: 1..30 }
  
end
