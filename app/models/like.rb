class Like < ApplicationRecord
  belongs_to :profile
  belongs_to :likeable, polymorphic: true

  validates :like_type, inclusion: { in: [1, -1] } 
  validates :profile_id, uniqueness: { scope: [:likeable_type, :likeable_id] } 
end
