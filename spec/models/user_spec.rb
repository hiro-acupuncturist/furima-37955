require 'rails_helper'

RSpec.describe User, type: :model do
     before do
          @user = FactoryBot.build(:user)
     end

  describe 'ユーザー新規登録'  do
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
      end
      it 'メールアドレスが重複してはいけない' do
      end
      it 'メールアドレスに@がないといけない' do
      end
      it 'パスワードが空では登録できない' do
      end
      it 'パスワードは6文字以上でないといけない' do
      end
      it 'パスワードは半角英数字混合でないといけない' do
      end
      it 'パスワードが確認と同一でないといけない' do
      end
      it 'firstnameが空ではいけない' do
      end
      it 'firstnameが全角でないといけない' do
      end
      it 'lastnameが空ではいけない' do
      end
      it 'lastnameが全角でないといけない' do
      end
      it 'firstname-kanaが空ではいけない' do
      end
      it 'firstname-kanaが全角でないといけない' do
      end
      it 'lastname-kanaが空ではいけない' do
      end
      it 'lastname-kanaが全角でないといけない' do
      end
      it  '青年月日が空ではいけない' do
      end
   end
  end
end
  #binding.pry