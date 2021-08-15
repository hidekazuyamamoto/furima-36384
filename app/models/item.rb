class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
  belongs_to :category
  belongs_to :status
  belongs_to :postage
  belongs_to :days

  belongs_to :user
  has_many :likes, dependent: :destroy
  has_one_attached :image, dependent: :destroy
  has_one :purchased

  with_options presence: true do
    validates :name
    validates :image
    validates :explanation
    validates :price, numericality: { greater_than: 299, less_than: 10000000 }
  end

  with_options numericality: { other_than: 1 } do
    validates :area_id
    validates :category_id
    validates :status_id
    validates :postage_id
    validates :days_id
  end

  def self.search_name(search)
    if search != ""
      Item.where('name LIKE(?)', "%#{search}%")
    else
      Item.all
    end
  end

  def self.search_category(search)
    if search != ""
      Item.where(category_id: search)
    else
      Item.all
    end
  end

end
