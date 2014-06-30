class AddEventToClub < ActiveRecord::Migration
  def change
    add_reference :clubs, :event, index: true
  end
end
