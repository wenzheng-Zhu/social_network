class AddTokenToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :login_token, :string
    add_index :users, %i[name email]
  end
end
