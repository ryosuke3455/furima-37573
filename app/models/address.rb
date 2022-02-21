class Address < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :item
end
