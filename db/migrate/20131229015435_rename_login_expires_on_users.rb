class RenameLoginExpiresOnUsers < ActiveRecord::Migration
  def change
  	rename_column :users, :login_expires_on, :session_expires_on
  end
end
