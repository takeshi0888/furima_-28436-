class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

        has_many :items
        has_many :comments
        has_many :orders

        validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: '半角英数字を使用してください' }, uniqueness: true
        validates :password, presence: true, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z{6}/i, message: 'パスワードは半角英数字で６文字以上入力して下さい' }
        validates :nickname, presence: true
       
        with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字を使用してください' } do
          validates :first_name
          validates :family_name
        end
        with_options presence: true, format: { with: /\A[ァ-ン]+\z/, message: '全角カタカナ文字を使用してください' } do
          validates :first_name_kana
          validates :family_name_kana
        end

end
