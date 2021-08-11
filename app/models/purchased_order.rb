class PurchasedOrder
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :city, :address, :building_name, :telephone_number, :area_id, :token, :item_price

  with_options presence: true do
    validates :postal_code, format:{with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :address
    validates :telephone_number, numericality: {only_integer: true}, length:{in:10..11}
    validates :token
    with_options numericality:{ other_than: 0} do
      validates :area_id
    end
  end

  def save 
    purchased = Purchased.create(user_id: user_id, item_id: item_id)
    Order.create(purchased_id: purchased.id, postal_code: postal_code, city: city, address: address, building_name: building_name, telephone_number: telephone_number, area_id: area_id)
  end
end