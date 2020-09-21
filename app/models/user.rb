class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books
  has_many :comments
  has_many :likes, dependent: :destroy 
  has_many :like_comments, through: :likes, source: :comment

  def already_liked?(comment)
    self.likes.exists?(comment_id: comment.id)
  end
end
