class BoughtRec < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_one :item
end
