require 'rails_helper'
RSpec.describe Book, type: :model do
  before do
    user = FactoryBot.create(:user)

    @book = FactoryBot.build(:book, user_id: user.id)
    @book.image = fixture_file_upload('app/assets/images/logo.png')
  end

  describe '登録できない時' do
    it 'nameが空だと登録できない' do
      @book.name = ''
      @book.valid?
      expect(@book.errors.full_messages).to include("Name can't be blank")
    end

    it 'category_idが空だと登録できない' do
      @book.category_id = 0
      @book.valid?
      expect(@book.errors.full_messages).to include('Category must be other than 0')
    end

    it 'imageが空だと登録できない' do
      @book.image = nil
      @book.valid?
      expect(@book.errors.full_messages).to include("Image can't be blank")
    end
  end

  context '登録がうまくいく時' do
    it '必要な情報が全て存在すれば登録できる' do
      expect(@book).to be_valid
    end
  end
end
