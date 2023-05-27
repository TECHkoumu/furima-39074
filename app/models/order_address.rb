class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id,:item_id,:postal_code, :prefecture_id, :city, :street,:building, :phone_number, :token

  validates :user_id, presence: true
  validates :item_id, presence: true
  validates :postal_code, presence: true, format: { with: /\A\d{3}-\d{4}\z/}
  validates :prefecture_id, presence: true, numericality: { other_than: 0, message: "can't be blank" } 
  validates :city, presence: true
  validates :street, presence: true
  validates :phone_number, presence: true, format: { with: /\A\d{10,11}\z/}
  validates :token, presence: true

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    address = Address.create(
    order_id: order.id,
    postal_code: postal_code,
    prefecture_id: prefecture_id,
    city: city,
    street: street,
    phone_number: phone_number
    )
    end
end