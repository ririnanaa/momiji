class Post < ApplicationRecord
  belongs_to :user
  has_many :post_genres, dependent: :destroy
  has_many :genres, through: :post_genres, dependent: :destroy
  has_many :post_categories, dependent: :destroy
  has_many :categories, through: :post_categories, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user

  has_one_attached :post_image

  def get_post_image(width, height)
    unless post_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpeg')
      post_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    post_image.variant(resize_to_limit: [width, height]).processed
  end

  def liked_by?(user)
    likes.exists?(user_id: user.id)
  end

  validates :name, uniqueness: true, length: { in: 1..75 }
  validates :day, length: { in: 1..100 }
  validates :close_day, length: { in: 1..100 }
  validates :hour, length: { in: 1..100 }
  validates :place, length: { in: 1..75 }
  validates :address, length: { in: 1..100 }
  validates :body, length: { in: 1..750 }
  validates :url, length: { in: 1..100 }
  validates :genre_id, acceptance: true
  validates :category_id, acceptance: true

  # 検索方法分岐
  def self.looks(word, method)
    if method == "partial_match"
      @post = Post.where(["name LIKE(?) OR day LIKE(?)","%#{word}%", "%#{word}%"])
    elsif method == "perfect_match"
      @post = Post.where(["name LIKE(?) OR day LIKE(?)","#{word}", "#{word}"])
    elsif method == "forward_match"
      @post = Post.where(["name LIKE(?) OR day LIKE(?)","#{word}%", "#{word}%"])
    elsif method == "backward_match"
      @post = Post.where(["name LIKE(?) OR day LIKE(?)","%#{word}", "%#{word}"])
    else
      @post = Post.all
    end
  end

  # 並べ替え
  scope :latest, -> { order(created_at: :desc) }
  scope :old, -> { order(created_at: :asc) }
  scope :liked, -> {
    select('posts.*, COUNT(likes.id) AS likes_count')
      .left_joins(:likes)
      .group('posts.id')
      .order('likes_count DESC')
  }

end
