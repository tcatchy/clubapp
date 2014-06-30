class AddUserToUni < ActiveRecord::Migration
  def change
    add_reference :unis, :user, index: true
  end
end
