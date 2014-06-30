class AddUniToLocation < ActiveRecord::Migration
  def change
    add_reference :locations, :uni, index: true
  end
end
