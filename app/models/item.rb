class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions  
  with_options presence: true do
    validates :name
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    validates :description
    validates :image
  end

  validates :price, numericality: { with: /\A[0-9]+\z/, message: 'Half-width number' }

  belongs_to :user
  has_one_attached :image
  has_one    :order

  belongs_to :category
  belongs_to :prefecture
  belongs_to :status
  belongs_to :shipping_day
  belongs_to :postage

  #ジャンルの選択が「---」の時は保存できないようにする
  with_options numericality: { other_than: 0, message: "can't be blank"} do
    validates :category_id
    validates :status_id
    validates :postage_id
    validates :prefecture_id
    validates :shipping_day_id
  end

end
