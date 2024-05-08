class Post < ApplicationRecord
  belongs_to :user
  has_many :post_genres, dependent: :destroy
  has_many :genres, through: :post_genres, dependent: :destroy
  has_many :post_categories, dependent: :destroy
  has_many :categories, through: :post_categories, dependent: :destroy
  
  has_one_attached :post_image
  
  def get_post_image(width, height)
    unless post_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpeg')
      post_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    post_image.variant(resize_to_limit: [width, height]).processed
  end
  
  validates :name, presence: true
  validates :daytime, presence: true
  validates :place, presence: true
  validates :address, presence: true
  validates :body, presence: true, length: { in: 1..750 }
  validates :genre_id, acceptance: true
  validates :category_id, acceptance: true
end
