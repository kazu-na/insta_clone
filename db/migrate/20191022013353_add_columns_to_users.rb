class AddColumnsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :uid, :string
    add_column :users, :oauth_token, :string
    add_column :users, :oauth_expires_at, :string
  end
end
