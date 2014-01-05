class RenameRecurringOnExchanges < ActiveRecord::Migration
  def self.up
    rename_column :exchanges, :reccuring, :recurring
  end

  def self.down
    rename_column :exchanges, :recurring, :reccuring 
  end
end
