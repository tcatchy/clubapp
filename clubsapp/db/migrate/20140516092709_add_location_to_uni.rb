class AddLocationToUni < ActiveRecord::Migration
  def change
    add_reference :unis, :location, index: true
  end
end
