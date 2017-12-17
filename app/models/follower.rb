class Follower < ApplicationRecord
  belongs_to :current, :class_name => 'User', :foreign_key => 'current_id'
  belongs_to :follower, :class_name => 'User', :foreign_key => 'follower_id'

  #Scope
  scope :get_followers, -> (id) {Follower.where(follower_id: id)}

end
