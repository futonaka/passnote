class AddOmniauthToUser < ActiveRecord::Migration
  def change
    add_column :users, :provider, :string, :after => :last_sign_in_ip
    add_column :users, :uid, :string, :after => :provider
    add_column :users, :name, :string, :after => :uid
    add_column :users, :token, :string, :after => :name
  end
end
