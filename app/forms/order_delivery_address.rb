class OrderDeliveryAddress

  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :address1, :address2, :building_name, :phone_number, :token

  validates :token, presence: true

  validates :prefecture_id, numericality: { other_than: 1 }
  validates :postal_code, presence: true, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'はハイフンを含めて７桁で入力して下さい' }
  validates :prefecture_id, presence: true
  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'は全角ひらがな、カタカナ、漢字で入力して下さい' } do
    validates :address1
    validates :address2
  end
  # validates :building_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'は全角ひらがな、カタカナ、漢字で入力して下さい' }
  validates :phone_number, presence: true, format: { with: /\d{10,11}/, message: 'は半角数字で入力して下さい' }

  def save
    # オーダーの情報を保存し、「order」という変数に入れている
    order = Order.create(user_id: user_id, item_id: item_id)
    # 住所の情報を保存
    DeliveryAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, address1: address1, address2: address2, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end

end