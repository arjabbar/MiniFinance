class AddBillerToExchanges < ActiveRecord::Migration
  def change
    add_reference :exchanges, :biller, index: true, null: true
  end
end
