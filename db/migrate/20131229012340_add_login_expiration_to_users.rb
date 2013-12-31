class AddLoginExpirationToUsers < ActiveRecord::Migration
  def change
    add_column :users, :login_expires_on, :datetime
  end
end
