class Item < ApplicationRecord
  validates :image, presence: true
  validates :name, presence: true
  validates :explanation, presence: true
  validates :category_id, numericality: { other_than: 0 }
  validates :quality_id, numericality: { other_than: 0 }
  validates :delivery_charge_id, numericality: { other_than: 0 }
  validates :prefecture_id, numericality: { other_than: 0 }
  validates :posting_id, numericality: { other_than: 0 }
  validates :price, presence: true, numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}

  belongs_to :user
  has_one :bought_rec
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :quality, :delivery_charge, :prefecture, :posting
end