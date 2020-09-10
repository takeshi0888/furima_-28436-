class Order < ApplicationRecord

  has_one_attached :image
  belongs_to :item
  belongs_to :user
  has_one :delivery_address


end
