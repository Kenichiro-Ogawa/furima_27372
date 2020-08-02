require 'rails_helper'

RSpec.describe PurchaseDeliveryDestination, type: :model do
  describe '#create' do
    before do
      @purchase_d_d = FactoryBot.build(:purchase_delivery_destination)
    end

    it '全ての値が正しく入力されていれば保存できること' do
      expect(@purchase_d_d).to be_valid
    end

    it '郵便番号が空だと保存できないこと' do
      @purchase_d_d.postal_code = nil
      @purchase_d_d.valid?
      expect(@purchase_d_d.errors[:postal_code]).to include("can't be blank")
    end
    it '郵便番号にハイフンがないと保存できないこと' do
      @purchase_d_d.postal_code = '1234567'
      @purchase_d_d.valid?
      expect(@purchase_d_d.errors[:postal_code]).to include("is invalid")
    end
    it '郵便番号が文字列だと保存できないこと' do
      @purchase_d_d.postal_code = 'aaa-aaaa'
      @purchase_d_d.valid?
      expect(@purchase_d_d.errors[:postal_code]).to include("is invalid")
    end

    it '都道府県が"---"のままだと保存できないこと' do
      @purchase_d_d.prefecture_id = 1
      @purchase_d_d.valid?
      expect(@purchase_d_d.errors[:prefecture_id]).to include('must be other than 1')
    end

    it '市区町村が空だと保存できないこと' do
      @purchase_d_d.city = nil
      @purchase_d_d.valid?
      expect(@purchase_d_d.errors[:city]).to include("can't be blank")
    end

    it '番地が空だと保存できないこと' do
      @purchase_d_d.street = nil
      @purchase_d_d.valid?
      expect(@purchase_d_d.errors[:street]).to include("can't be blank")
    end

    it '電話番号が空だと保存できないこと' do
      @purchase_d_d.phone = nil
      @purchase_d_d.valid?
      expect(@purchase_d_d.errors[:phone]).to include("can't be blank")
    end
    it '電話番号にハイフンがあると保存できないこと' do
      @purchase_d_d.phone = '080-1234567'
      @purchase_d_d.valid?
      expect(@purchase_d_d.errors[:phone]).to include("is invalid")
    end
    it '電話番号が11桁より多いと保存できないこと' do
      @purchase_d_d.phone = '080123456789'
      @purchase_d_d.valid?
      expect(@purchase_d_d.errors[:phone]).to include("is invalid")
    end
    it '電話番号が10桁未満だと保存できないこと' do
      @purchase_d_d.phone = '080123456'
      @purchase_d_d.valid?
      expect(@purchase_d_d.errors[:phone]).to include("is invalid")
    end
  end
end
