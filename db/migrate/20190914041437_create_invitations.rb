# frozen_string_literal: true

class CreateInvitations < ActiveRecord::Migration[5.2]
  def change
    create_table :invitations do |t|
      t.string :email
      t.integer :event_creator
      t.integer :event_id
      t.integer :invited_user

      t.timestamps
    end
  end
end
