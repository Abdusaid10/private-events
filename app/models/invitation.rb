class Invitation < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'event_creator'
  belongs_to :event, class_name: 'Event', foreign_key: 'event_id'
  belongs_to :invited_user, class_name: 'User', foreign_key: 'invited_user'
 
  before_save :check_user_existence

  def check_user_existence
    user= User.find_by_email(email)
    if user
      self.invited_user = user.id
    end
  end

end
