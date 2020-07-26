require 'rails_helper'

describe Item do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('public/images/test_image.jpg')
    end

    it "全ての値が正しく入力されていれば保存できること" do
      expect(@item).to be_valid
    end
  end
end