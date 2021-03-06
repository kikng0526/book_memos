class Comment < ApplicationRecord
  belongs_to :book
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :liking_users, through: :likes, source: :user

  validates :text, presence: true

  # has_many :liked_users, through: :likes, source: :user
end
