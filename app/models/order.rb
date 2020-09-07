class Order < ApplicationRecord
  has_one_attached :image
  belongs_to :item
  belongs_to :user
  belongs_to :delivery_address
end
