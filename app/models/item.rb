class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
  belongs_to :category
  belongs_to :statue
  belongs_to :postage
  belongs_to :days

  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :explanation
    validates :price
  end

  with_options numericality: { other_than: 1 } do
    validates :area_id 
    validates :category_id  
    validates :status_id 
    validates :postage_id 
    validates :days_id 
  end
  
end
