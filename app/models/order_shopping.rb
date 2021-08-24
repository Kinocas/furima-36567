class OrderShopping
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :token
    validates :user_id
    validates :item_id
    validates :postal_code
    validates :city
    validates :address
    validates :phone_number
  end
  validates :prefecture_id, numericality: { other_than: 1, message: "を選択してください" }
  validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "が不正な値か、ハイフンが含まれていません"}, allow_blank: true
  validates :phone_number, format: {with: /\A\d{10,11}\z/}, allow_blank: true

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Shopping.create(
      postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, 
      building: building, phone_number: phone_number, order_id: order.id
    )
  end

end