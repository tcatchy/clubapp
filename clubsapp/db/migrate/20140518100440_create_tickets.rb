class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.integer :number
      t.float :price
      t.date :start_date
      t.date :end_date
      t.string :purchase_location
      t.string :description
      t.integer :count

      t.timestamps
    end
  end
end
