class CreateAnnouncementsClubs < ActiveRecord::Migration
  def self.up
    create_table :announcements_clubs, :id => false do |t|
        t.references :announcement
        t.references :club
    end
    add_index :announcements_clubs, [:announcement_id, :club_id]
    add_index :announcements_clubs, :club_id
  end

  def self.down
    drop_table :announcements_clubs
  end
end
