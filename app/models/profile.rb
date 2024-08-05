class Profile < ApplicationRecord
    belongs_to :user
    validates :username, uniqueness: true, on: :create
end
