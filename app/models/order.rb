class Order < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
  belongs_to :purchased
  with_options presence: true do
    validates :postal_code
    validates :city
    validates :address
    validates :telephone_number
    with_options numericality:{ other_than: 0} do
      validates :area_id
    end
  end
end
