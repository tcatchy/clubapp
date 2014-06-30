class AddLocationToClub < ActiveRecord::Migration
  def change
    add_reference :clubs, :location, index: true
  end
end
