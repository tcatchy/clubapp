class AddUniToUser < ActiveRecord::Migration
  def change
    add_reference :users, :uni, index: true
  end
end
