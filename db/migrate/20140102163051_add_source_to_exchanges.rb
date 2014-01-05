class AddSourceToExchanges < ActiveRecord::Migration
  def change
    add_column :exchanges, :source, :string, null: true
  end
end
