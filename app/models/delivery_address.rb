class DeliveryAddress < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  validates :prefecture_id, numericality: { other_than: 1 }

  belongs_to :order

  validates :postal_code, presence: true, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'はハイフンを含めて７桁で入力して下さい' }
  validates :prefecture_id, presence: true

  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'は全角ひらがな、カタカナ、漢字で入力して下さい' } do
    validates :address1
    validates :address2
  end

  validates :building_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'は全角ひらがな、カタカナ、漢字で入力して下さい' }
  validates :phone_number, presence: true, format: { with: /\d{10,11}/, message: 'は半角数字で入力して下さい' }

end
