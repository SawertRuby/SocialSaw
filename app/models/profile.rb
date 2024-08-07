class Profile < ApplicationRecord
    belongs_to :user
    validates :username, uniqueness: true, on: :create
    has_one_attached :avatar 
end
