require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end
    context 'ユーザー機能に問題がない場合' do
      it '全てが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'emailに@が含まれていれば登録できる' do
        @user.email = 'sample@gmail.com'
        expect(@user).to be_valid
      end
      it 'passwordが英数字混合であれば登録でる' do
        @user.password = 'abc123'
        @user.password_confirmation = 'abc123'
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上であれば登録できる' do
        @user.password = 'abc123'
        @user.password_confirmation = 'abc123'
        expect(@user).to be_valid
      end
    end

    context 'ユーザー機能に問題がある場合' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "ニックネームを入力してください"
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Eメールを入力してください"
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワードを入力してください"
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "苗字（全角）を入力してください"
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "名前（全角）を入力してください"
      end
      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "苗字（カナ）を入力してください"
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "名前（カナ）を入力してください"
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "生年月日を入力してください"
      end
      it 'emailに@が含まなければ登録できない' do
        @user.email = 'samplegmail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Eメールは不正な値です'
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = 'abc123'
        @user.password_confirmation = 'abcd1234'
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワード（確認用）とパスワードの入力が一致しません"
      end
      it 'passwordが全角では登録できない' do
        @user.password = 'ａｂｃ１２３'
        @user.password_confirmation = 'ａｂｃ１２３'
        @user.valid?
        expect(@user.errors.full_messages).to include 'パスワードは不正な値です'
      end
      it 'passwordが英字のみでは登録できない' do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include 'パスワードは不正な値です'
      end
      it 'passwordが数字のみでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include 'パスワードは不正な値です'
      end
      it 'passwordが5文字以下であれば登録できない' do
        @user.password = 'abc12'
        @user.password_confirmation = 'abc12'
        @user.valid?
        expect(@user.errors.full_messages).to include 'パスワードは6文字以上で入力してください'
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
      end
      it 'last_nameが英数字では登録できない' do
        @user.last_name = 'abc123'
        @user.valid?
        expect(@user.errors.full_messages).to include '苗字（全角）は不正な値です'
      end
      it 'first_nameが英数字では登録できない' do
        @user.first_name = 'abc123'
        @user.valid?
        expect(@user.errors.full_messages).to include '名前（全角）は不正な値です'
      end
      it 'last_name_kanaがカタカナ以外では登録できない' do
        @user.last_name_kana = 'abc123'
        @user.valid?
        expect(@user.errors.full_messages).to include '苗字（カナ）は不正な値です'
      end
      it 'first_name_kanaがカタカナ以外では登録できない' do
        @user.first_name_kana = 'abc123'
        @user.valid?
        expect(@user.errors.full_messages).to include '名前（カナ）は不正な値です'
      end
    end
  end
end
