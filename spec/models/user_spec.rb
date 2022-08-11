require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  
  describe '新規登録ユーザー情報' do
    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる' do
      expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emaiは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが129文字以上では登録できない' do
        @user.password = Faker::Internet.password(min_length: 129)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too long (maximum is 128 characters)")
      end
      it 'パスワードが英語のみでは登録できない' do
        @user.password = 'abcdef'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は半角英数を両方含む必要があります')
      end
      it 'パスワードが数字のみでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は半角英数を両方含む必要があります')
      end
    end
  end

  describe '新規登録本人情報確認' do
    it 'first_nameが空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it 'first_nameが半角では登録できない' do
      @user.first_name = 'aaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end
    it 'family_nameが空では登録できない' do
      @user.family_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank")
    end
    it 'family_nameが半角では登録できない' do
      @user.family_name = 'aaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name is invalid")
    end
    it 'first_name_kanaが空では登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank", "First name kana is invalid")
    end
    it 'first_name_kanaが半角では登録できない' do
      @user.first_name_kana = 'aaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end
    it 'family_name_kanaが空では登録できない' do
      @user.family_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana can't be blank", "Family name kana is invalid")
    end
    it 'family_name_kanaが半角では登録できない' do
      @user.family_name_kana = 'aaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana is invalid")
    end
    it 'birth_dayが空では登録できない' do
      @user.birth_day = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth day can't be blank")
    end
  end

  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録できない' do
      # nicknameが空では登録できないテストコードを記述します
    end
    it 'emailが空では登録できない' do
      # emailが空では登録できないテストコードを記述します
    end
    it 'nicknameが空では登録できない' do
      # nicknameが空では登録できないテストコードを記述します
    end
    it 'emailが空では登録できない' do
      # emailが空では登録できないテストコードを記述します
    end
  end

end
