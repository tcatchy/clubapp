class DeviseCreateClubs < ActiveRecord::Migration
  def change
    create_table(:clubs) do |t|
      ## Database authenticatable
      t.string :nickname,           null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at

      t.string :name
      t.string :description
      t.string :website
      t.integer :reg_no
      t.string :president_first_name
      t.string :president_last_name
      t.string :president_contact
      t.string :president_email
      t.string :treasurer_first_name
      t.string :treasurer_last_name
      t.string :treasurer_contact
      t.string :treasurer_email
      t.string :admin_first_name
      t.string :admin_last_name
      t.string :admin_contact
      t.string :admin_email
      t.string :email
      t.attachment :banner
      t.boolean :approved, :default => true, :null => true

      t.timestamps
    end

    add_index :clubs, :nickname,             unique: true
    add_index :clubs, :reset_password_token, unique: true
    # add_index :clubs, :confirmation_token,   unique: true
    # add_index :clubs, :unlock_token,         unique: true
  end
end
