class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions  
  with_options presence: true do
    validates :user_id
    validates :name
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    validates :category_id
    validates :status_id
    validates :postage_id
    validates :prefecture_id
    validates :shipping_day_id
    validates :description
    validates :image
  end

  belongs_to :user
  has_one    :purchase
  has_one_attached :image

  belongs_to :category
  belongs_to :prefecture
  belongs_to :status
  belongs_to :shipping_day

  #ジャンルの選択が「---」の時は保存できないようにする
  with_options numericality: { other_than: 0, message: "can't be blank"} do
    validates :category_id
    validates :status_id
    validates :postage_id
    validates :prefecture_id
    validates :shipping_day_id
  end

end
