require 'rails_helper'

describe Item do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('public/images/test_image.png')
    end

    it '全ての値が正しく入力されていれば保存できること' do
      expect(@item).to be_valid
    end

    it '画像が空だと保存できないこと' do
      @item.image = nil
      @item.valid?
      expect(@item.errors[:image]).to include("を入力してください")
    end
    it '商品の名前が空だと保存できないこと' do
      @item.name = nil
      @item.valid?
      expect(@item.errors[:name]).to include("を入力してください")
    end
    it '商品の説明が空だと保存できないこと' do
      @item.info = nil
      @item.valid?
      expect(@item.errors[:info]).to include("を入力してください")
    end
    it 'カテゴリーが"---"のままだと保存できないこと' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors[:category_id]).to include('は1以外の値にしてください')
    end
    it '商品の状態が"---"のままだと保存できないこと' do
      @item.status_id = 1
      @item.valid?
      expect(@item.errors[:status_id]).to include('は1以外の値にしてください')
    end
    it '配送料の負担が"---"のままだと保存できないこと' do
      @item.delivery_fee_id = 1
      @item.valid?
      expect(@item.errors[:delivery_fee_id]).to include('は1以外の値にしてください')
    end
    it '発送までの日数が"---"のままだと保存できないこと' do
      @item.delivery_time_id = 1
      @item.valid?
      expect(@item.errors[:delivery_time_id]).to include('は1以外の値にしてください')
    end
    it '発送元の地域が"---"のままだと保存できないこと' do
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors[:prefecture_id]).to include('は1以外の値にしてください')
    end
    it '価格が空だと保存できないこと' do
      @item.price = nil
      @item.valid?
      expect(@item.errors[:price]).to include("を入力してください")
    end
    it '価格が300円未満だと保存できないこと' do
      @item.price = 299
      @item.valid?
      expect(@item.errors[:price]).to include('は300以上の値にしてください')
    end
    it '価格が9,999,9999円より上だと保存できないこと' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors[:price]).to include('は9999999以下の値にしてください')
    end
  end
end
