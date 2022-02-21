class Item < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :bought_rec
  has_one :address
end
