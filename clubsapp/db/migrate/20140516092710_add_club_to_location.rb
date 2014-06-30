class AddClubToLocation < ActiveRecord::Migration
  def change
    add_reference :locations, :club, index: true
  end
end
