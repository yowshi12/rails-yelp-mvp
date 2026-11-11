class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy
  validates :name, presence: true
  validates :address, presence: true
  CATEGORIES = [ "chinese", "italian", "japanese", "french", "belgian" ]
  validates :category, presence: true, inclusion: { in: CATEGORIES }
  # restaurant::categories
  def avg_rating
    return 0 if reviews.empty?

    reviews.pluck(:rating).sum.fdiv(reviews.length).round
  end
end
