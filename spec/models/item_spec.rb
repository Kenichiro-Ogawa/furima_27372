require 'rails_helper'

describe Item do
  describe '#create' do
    it "全ての値が正しく入力されていれば保存できること" do
      item = build(:item)
      binding.pry
      expect(item).to be_valid
    end
  end
end