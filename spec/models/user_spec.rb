require 'rails_helper'

describe User do
  describe '#create' do

    it '全ての値が正しく入力されていれば保存できること' do
      user = build(:user)
      expect(user).to be_valid
    end

    # ニックネーム
    it 'nicknameが空だと保存できないこと' do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    # email
    it 'emailが空だと保存できないこと' do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end
    it '同じemailは登録できないこと' do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end
    it 'emailに@がなければ保存できないこと' do
      user = build(:user, email: 'aaaa.com')
      user.valid?
      expect(user.errors[:email]).to include("is invalid")
    end

    # パスワード
    it 'passwordが空だと保存できないこと' do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end
    it 'passwordが数字だけだと保存できないこと' do
      user = build(:user, password: '111111')
      user.valid?
      expect(user.errors[:password]).to include("is invalid")
    end
    it 'passwordが英字だげだと保存できないこと' do
      user = build(:user, password: 'testtest')
      user.valid?

      expect(user.errors[:password]).to include("is invalid")
    end
    it 'passwordが全角だと保存できないこと' do
      user = build(:user, password: 'あいう１２b')
      user.valid?
      expect(user.errors[:password]).to include("is invalid")
    end
    it 'passwordが6文字未満だと保存できないこと' do
      user = build(:user, password: 'ab123')
      user.valid?
      expect(user.errors[:password]).to include("is too short (minimum is 6 characters)")
    end
    it "passwordが存在してもpassword_confirmationが空では登録できないこと" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    # 名字
    it 'family_nameが空だと保存できないこと' do
      user = build(:user, family_name: nil)
      user.valid?
      expect(user.errors[:family_name]).to include("can't be blank")
    end
    it 'family_nameが数字だと保存できないこと' do
      user = build(:user, family_name: '123')
      user.valid?
      expect(user.errors[:family_name]).to include("is invalid")
    end
    it 'family_nameが英字だと保存できないこと' do
      user = build(:user, family_name: 'ogawa')
      user.valid?
      expect(user.errors[:family_name]).to include("is invalid")
    end
    it 'family_nameが半角だと保存できないこと' do
      user = build(:user, family_name: 'ｵｶﾞﾜogawa123')
      user.valid?
      expect(user.errors[:family_name]).to include("is invalid")
    end

    # 名前
    it 'first_nameが空だと保存できないこと' do
      user = build(:user, first_name: nil)
      user.valid?
      expect(user.errors[:first_name]).to include("can't be blank")
    end
    it 'first_nameが数字だと保存できないこと' do
      user = build(:user, first_name: '123')
      user.valid?
      expect(user.errors[:first_name]).to include("is invalid")
    end
    it 'first_nameが英字だと保存できないこと' do
      user = build(:user, first_name: 'kenichiro')
      user.valid?
      expect(user.errors[:first_name]).to include("is invalid")
    end
    it 'first_nameが半角だと保存できないこと' do
      user = build(:user, first_name: 'ｹﾝｲﾁﾛｳken123')
      user.valid?
      expect(user.errors[:first_name]).to include("is invalid")
    end

    # 名字(カナ)
    it 'family_name_kanaが空だと保存できないこと' do
      user = build(:user, family_name_kana: nil)
      user.valid?
      expect(user.errors[:family_name_kana]).to include("can't be blank")
    end
    it 'family_name_kanaが漢字だと保存できないこと' do
      user = build(:user, family_name_kana: '小川')
      user.valid?
      expect(user.errors[:family_name_kana]).to include("is invalid")
    end
    it 'family_name_kanaが数字だと保存できないこと' do
      user = build(:user, family_name_kana: '123')
      user.valid?
      expect(user.errors[:family_name_kana]).to include("is invalid")
    end
    it 'family_name_kanaが英字だと保存できないこと' do
      user = build(:user, family_name_kana: 'ogawa')
      user.valid?
      expect(user.errors[:family_name_kana]).to include("is invalid")
    end
    it 'family_name_kanaがひらがなだと保存できないこと' do
      user = build(:user, family_name_kana: 'おがわ')
      user.valid?
      expect(user.errors[:family_name_kana]).to include("is invalid")
    end
    it 'family_name_kanaが半角だと保存できないこと' do
      user = build(:user, family_name_kana: 'ｵｶﾞﾜ')
      user.valid?
      expect(user.errors[:family_name_kana]).to include("is invalid")
    end

    # 名前(カナ)
    it 'first_name_kanaが空だと保存できないこと' do
      user = build(:user, first_name_kana: nil)
      user.valid?
      expect(user.errors[:first_name_kana]).to include("can't be blank")
    end
    it 'first_name_kanaが漢字だと保存できないこと' do
      user = build(:user, first_name_kana: '健一郎')
      user.valid?
      expect(user.errors[:first_name_kana]).to include("is invalid")
    end
    it 'first_name_kanaが数字だと保存できないこと' do
      user = build(:user, first_name_kana: '123')
      user.valid?
      expect(user.errors[:first_name_kana]).to include("is invalid")
    end
    it 'first_name_kanaが英字だと保存できないこと' do
      user = build(:user, first_name_kana: 'kenichiro')
      user.valid?
      expect(user.errors[:first_name_kana]).to include("is invalid")
    end
    it 'first_name_kanaがひらがなだと保存できないこと' do
      user = build(:user, first_name_kana: 'けんいちろう')
      user.valid?
      expect(user.errors[:first_name_kana]).to include("is invalid")
    end
    it 'first_name_kanaが半角だと保存できないこと' do
      user = build(:user, first_name_kana: 'ｹﾝｲﾁﾛｳ')
      user.valid?
      expect(user.errors[:first_name_kana]).to include("is invalid")
    end

    # 生年月日
    it 'birthdayに空の値があると保存できないこと' do
      user = build(:user, birthday: '1990-nil-21')
      user.valid?
      expect(user.errors[:birthday]).to include("can't be blank")
    end

  end
end