class Restaurant < ApplicationRecord
  CATEGORY = %w[chinese italian japanese french belgian]
  has_many :reviews, dependent: :destroy
  validates :name, :address, :category, presence: true
  validates :category, inclusion: { in: %w[chinese italian japanese french belgian] }

  # validates :category, inclusion: { in: ["chinese", "italian", "japanese", "french", "belgian"] }
end
