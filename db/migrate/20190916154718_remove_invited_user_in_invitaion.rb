# frozen_string_literal: true

class RemoveInvitedUserInInvitaion < ActiveRecord::Migration[5.2]
  def change
    remove_column :invitations, :invited_user
  end
end
