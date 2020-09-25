require 'rails_helper'
RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  describe '登録できない時' do
    it 'textが空だと登録できない' do
      @comment.text = ''
      @comment.valid?
      expect(@comment.errors.full_messages).to include("Text can't be blank")
    end
  end

  context '登録がうまくいく時' do
    it '必要な情報が全て存在すれば登録できる' do
      expect(@comment).to be_valid
    end
  end
end
