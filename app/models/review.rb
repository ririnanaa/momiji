class Review < ApplicationRecord
  
  belongs_to :user
  belongs_to :post
  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :user
  
  enum day: { ordinary: 0, weekend: 1, ordinary_limit: 2, weekend_limit: 3 }
  enum time: { open: 0, am: 1, noon: 2, afternoon: 3, early_evening: 4, evening: 5 }
  enum congestion: { empty: 0, full: 1, admission_limit_bit: 2, admission_limit: 3, admission_limit_many: 4 }
  
  validates :title, presence: true, length: { in: 1..50 }
  validates :body, presence: true, length: { in: 10..500 }
  validates :rate, presence: true
  
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end  
    
  # 並べ替え
  scope :latest, -> { order(created_at: :desc) }
  scope :old, -> { order(creatd_at: :asc) }
  scope :favorited, -> {
    select('reviews.*, COUNT(favorites.id) AS favorites_count')
      .left_joins(:favorites)
      .group('reviews.id')
      .order('favorites_count DESC')
  }
  
end
