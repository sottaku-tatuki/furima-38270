class User < ApplicationRecord
  with_options presence: true do
    validates :nickname      
    validates :family_name   
    validates :first_name
    validates :family_name_kana  
    validates :first_name_kana
    validates :birth_day  
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders
end
