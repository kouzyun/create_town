require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'モデルのバリデーション' do
    before do
      @post = build(:post)
    end

    it '全て値が設定されている' do
      expect(@post.valid?).to eq(true)
    end

    it 'titleが空だとNG' do
      @post.title = ''
      expect(@post.valid?).to eq(false)
    end

    it 'bodyが空だとNG' do
      @post.body = ''
      expect(@post.valid?).to eq(false)
    end

    it 'imageが空だとNG' do
      @post.image_id = ''
      expect(@post.valid?).to eq(false)
    end

    it 'addressが空だとNG' do
      @post.address = ''
      expect(@post.valid?).to eq(false)
    end
  end
end