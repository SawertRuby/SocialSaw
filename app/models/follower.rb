class Follower < ApplicationRecord
  belongs_to :follower, class_name: 'Profile'
  belongs_to :followed, class_name: 'Profile'

  validates :follower_id, uniqueness: { scope: :followed_id }
end
