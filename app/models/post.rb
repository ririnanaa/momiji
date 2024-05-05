class Post < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  belongs_to :category
  
  has_one_attached :post_image
end
