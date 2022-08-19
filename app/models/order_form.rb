class OrderForm
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :prefecture_id, :post_code, :municipalities, :house_number, :building_name, :phone_number, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :municipalities
    validates :house_number
    validates :phone_number, format: { with: /\A[0-9]{11}\z/, message: 'is invalid' },  length: { minimum: 10, maximum: 11 }
    validates :token
  end


  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(order_id: order.id, prefecture_id: prefecture_id, post_code: post_code, municipalities: municipalities, house_number: house_number, building_name: building_name, phone_number: phone_number)
  end
end