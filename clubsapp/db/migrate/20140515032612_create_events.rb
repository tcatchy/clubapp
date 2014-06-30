class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :event_type
      t.datetime :event_time
      t.string :location
      t.string :description
      t.attachment :image1
      t.attachment :image2
      t.attachment :image3

      t.timestamps
    end
  end
end
