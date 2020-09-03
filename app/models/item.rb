class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to_active_hash :genre
  belongs_to_active_hash :status
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :delivery_day
  belongs_to_active_hash :delivery_fee
  # validates :image, :name, :explanation, :genre, :status, :delivery_fee, :prefecture, :delivery_day, :price presence: true
  validates :genre_id, :status_id, :delivery_fee_id, :prefecture_id, :delivery_day_id, numericality: { other_than: 1 }

  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :explanation
    validates :genre_id
    validates :status_id
    validates :delivery_fee_id
    validates :prefecture_id
    validates :delivery_day_id
  end
  validates :price, presence: true, format: { with: /\A[a-zA-Z0-9]+\z/, message: 'は¥300〜9,999,999で入力して下さい' }, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
end
