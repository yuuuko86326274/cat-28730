# frozen_string_literal: true

class DeviseCreateTraders < ActiveRecord::Migration[6.0]
  def change
    create_table :traders do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.string :t_name,             null: false
      t.string :t_postal_code,      null: false
      t.integer :area_id,           null: false
      t.string :t_city,             null: false
      t.string :t_address_num,      null: false
      t.string :t_building_num
      t.string :t_tel,              null: false
      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      # t.integer  :sign_in_count, default: 0, null: false
      # t.datetime :current_sign_in_at
      # t.datetime :last_sign_in_at
      # t.string   :current_sign_in_ip
      # t.string   :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at


      t.timestamps null: false
    end

    add_index :traders, :email,                unique: true
    add_index :traders, :reset_password_token, unique: true
    # add_index :traders, :confirmation_token,   unique: true
    # add_index :traders, :unlock_token,         unique: true
  end
end
