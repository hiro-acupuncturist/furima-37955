class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze

         validates :password,        format: { with: VALID_PASSWORD_REGEX, message: 'は半角英数を両方含む必要があります' } 
         validates :nickname,        presence: true
         validates :first_name,      presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/, message: '全角ひらがな、全角カタカナ、漢字で入力して下さい' }
         validates :last_name,       presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/, message: '全角ひらがな、全角カタカナ、漢字で入力して下さい' }
         validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: '全角カタカナで入力して下さい' }
         validates :last_name_kana,  presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: '全角カタカナで入力して下さい' }
         validates :date_of_birth,   presence: true
end
