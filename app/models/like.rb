class Like < ApplicationRecord
  belongs_to :user
  belongs_to :comment
  belongs_to :book

  # 一つのコメントに対し１いいね
  validates_uniqueness_of :comment_id, scope: :user_id 
end
