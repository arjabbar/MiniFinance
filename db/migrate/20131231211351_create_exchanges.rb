class CreateExchanges < ActiveRecord::Migration
  def change
    create_table :exchanges do |t|
      t.references :user, index: true
      t.integer :amount_in_cents
      t.boolean :reccuring
      t.datetime :start_date
      t.datetime :end_date
      t.string :type

      t.timestamps
    end
  end
end
