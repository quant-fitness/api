# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users, id: :uuid do |t|
      t.citext :email_address

      t.timestamps
    end
    add_index :users, :email_address, unique: true
  end
end
