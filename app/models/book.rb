class Book < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to_active_hash :category
  has_one_attached :image

  validates :category_id, numericality: { other_than: 0 }

  def self.search(search) #self.でクラスメソッドとしている
    if search # Controllerから渡されたパラメータが!= nilの場合は、titleカラムを部分一致検索
      Book.where(['name LIKE ?', "%#{search}%"])
    else
      Book.all #全て表示。
    end
  end
end
