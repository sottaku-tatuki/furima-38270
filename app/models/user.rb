class User < ApplicationRecord
  with_options presence: true do
    validates :nickname      
    validates :birth_day  
    with_options format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/ } do
      validates :family_name   
      validates :first_name
    end
    with_options format: { with: /\A[ァ-ヶー－]+\z/ } do
      validates :family_name_kana
      validates :first_name_kana   
    end
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX, message: "は半角英数を両方含む必要があります"}

  has_many :items
  # has_many :orders
end
