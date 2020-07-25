require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'モデルのバリデーション' do
    before do
      @user = build(:user)
    end

    it '全て値が設定されている' do
      expect(@user.valid?).to eq(true)
    end

    it 'last_nameが空だとNG' do
      @user.last_name = ''
      expect(@user.valid?).to eq(false)
    end

    it 'first_nameが空だとNG' do
      @user.first_name = ''
      expect(@user.valid?).to eq(false)
    end

    it 'emailが空だとNG' do
      @user.email = ''
      expect(@user.valid?).to eq(false)
    end

    it 'passwordが空だとNG' do
      @user.password = ''
      expect(@user.valid?).to eq(false)
    end
  end
end