class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to_active_hash :genre, :status, :prefecture, :delivery_day, :delivery_fee

  validates :image, :name, :explanation, :genre, :status, :delivery_fee, :prefecture, :delivery_day, :price presence: true
  validates :genre_id, :status_id, :delivery_fee_id, :prefecture_id, :delivery_day_id, numericality: { other_than: 1 } 
end