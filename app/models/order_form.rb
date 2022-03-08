class OrderForm
  include ActiveModel::Model
  
  attr_accessor :token, :post_code, :prefecture_id, :city, :address, :building, :phone, :item_id, :user_id
  
  #後からwith_optionを追加
  validates :token, presence: true
  validates :post_code, presence: true, format: { with: /\A\d{3}[-]\d{4}\z/}
  validates :prefecture_id, numericality: { other_than: 0 }
  validates :city, presence: true
  validates :address, presence: true
  validates :phone, presence: true, format: { with: /\A^0\d{9,10}$\z/}

  def save
    bought_rec = BoughtRec.create(item_id: item_id, user_id: user_id)
    Address.create(bought_rec_id: bought_rec.id, post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone: phone)
  end
end