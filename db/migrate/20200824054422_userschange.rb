class Userschange < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :nickname, :string, null: false
    change_column :users, :family_name, :string, null: false
    change_column :users, :first_name, :string, null: false
    change_column :users, :family_name_kana, :string, null: false
    change_column :users, :first_name_kana, :string, null: false
    change_column :users, :date_of_birth, :date, null: false
  end
end
