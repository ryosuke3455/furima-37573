class User < ApplicationRecord
  has_many :items
  has_many :bought_recs
  has_one :address
end
