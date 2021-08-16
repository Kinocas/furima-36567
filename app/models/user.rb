class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable 

  validates :nickname, presence: true
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]{6,}+\z/ }
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ } do 
    validates :last_name
    validates :first_name
  end
  with_options presence: true, format: { with: /\A[\p{katakana}\u{30fc}]+\z/ } do  
    validates :last_name_kana
    validates :first_name_kana
  end
  validates :birthday, presence: true

end
#