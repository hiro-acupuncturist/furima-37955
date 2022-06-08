require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録ができる時' do
      it '入力フォームに書かれたもの適正に入力すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できない時' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'メールアドレスが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'メールアドレスが重複してはいけない' do
        @user.save
        anothre_user = FactoryBot.build(:user)
        anothre_user.email = @user.email
        anothre_user.valid?
        expect(anothre_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'メールアドレスに@がないといけない' do
        @user.email = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'パスワードが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank", 'Password は半角英数を両方含む必要があります')
      end
      it 'パスワードは6文字以上でないといけない' do
        @user.password = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)',
                                                      'Password は半角英数を両方含む必要があります')
      end
      it 'パスワードは半角英数字混合でないといけない' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は半角英数を両方含む必要があります')
      end
      it 'パスワードが確認と同一でないといけない' do
        @user.password = 'aaa111'
        @user.password_confirmation = 'aaa1111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'first-nameが空ではいけない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank", 'First name 全角ひらがな、全角カタカナ、漢字で入力して下さい')
      end
      it 'first-nameが全角でないといけない' do
        @user.first_name = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name 全角ひらがな、全角カタカナ、漢字で入力して下さい')
      end
      it 'last-nameが空ではいけない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank", 'Last name 全角ひらがな、全角カタカナ、漢字で入力して下さい')
      end
      it 'last-nameが全角でないといけない' do
        @user.last_name = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name 全角ひらがな、全角カタカナ、漢字で入力して下さい')
      end
      it 'first-name-kanaが空ではいけない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank", 'First name kana 全角カタカナで入力して下さい')
      end
      it 'first-name-kanaが全角でないといけない' do
        @user.first_name_kana = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana 全角カタカナで入力して下さい')
      end
      it 'last-name-kanaが空ではいけない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank", 'Last name kana 全角カタカナで入力して下さい')
      end
      it 'last-name-kanaが全角でないといけない' do
        @user.last_name_kana = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana 全角カタカナで入力して下さい')
      end
      it '青年月日が空ではいけない' do
        @user.date_of_birth = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Date of birth can't be blank")
      end
    end
  end
end
