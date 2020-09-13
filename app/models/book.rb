class Book < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to_active_hash :category
  has_one_attached :image

  validates :category_id, numericality: { other_than: 0 }
end
