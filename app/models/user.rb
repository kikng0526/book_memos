class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books
  has_many :comments
  has_one_attached :image
  has_many :likes, dependent: :destroy 
  has_many :like_comments, through: :likes, source: :comment

  validates :nickname, presence: true

  with_options presence: true do
     #  password半角英数字混合指定
     VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
     validates :password, { format: { with: VALID_PASSWORD_REGEX } }
     #  email正規表現
     VALID_EMAIL_REGEX = /^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/.freeze
     validates :email, { format: {with: VALID_EMAIL_REGEX}}
  end



  def already_liked?(comment)
    self.likes.exists?(comment_id: comment.id)
  end
end
