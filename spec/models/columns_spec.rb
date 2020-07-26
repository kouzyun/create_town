require 'rails_helper'

RSpec.describe Column, type: :model do
  describe 'モデルのバリデーション' do
    before do
      @column = build(:column)
    end

    it '全て値が設定されている' do
      expect(@column.valid?).to eq(true)
    end

    it 'titleが空だとNG' do
      @column.title = ''
      expect(@column.valid?).to eq(false)
    end

    it 'bodyが空だとNG' do
      @column.body = ''
      expect(@column.valid?).to eq(false)
    end

    it 'column_imageが空だとNG' do
      @column.column_image_id = ''
      expect(@column.valid?).to eq(false)
    end
  end
end