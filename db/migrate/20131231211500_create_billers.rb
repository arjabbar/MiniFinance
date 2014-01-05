class CreateBillers < ActiveRecord::Migration
  def change
    create_table :billers do |t|
      t.string :name
      t.string :website
      t.string :phone

      t.timestamps
    end
  end
end
