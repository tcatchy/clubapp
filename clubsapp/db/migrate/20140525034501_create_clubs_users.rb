class CreateClubsUsers < ActiveRecord::Migration
  def self.up
    create_table :clubs_users, :id => false do |t|
        t.references :club
        t.references :user
    end
    add_index :clubs_users, [:club_id, :user_id]
    add_index :clubs_users, :user_id
  end

  def self.down
    drop_table :clubs_users
  end
end