class CreateTicketsUsers < ActiveRecord::Migration
  def self.up
    create_table :tickets_users, :id => false do |t|
        t.references :ticket
        t.references :user
    end
    add_index :tickets_users, [:ticket_id, :user_id]
    add_index :tickets_users, :user_id
  end

  def self.down
    drop_table :tickets_users
  end
end