class Profile < ApplicationRecord
    belongs_to :user
    validates :username, uniqueness: true, on: :create
    has_one_attached :avatar
    has_many :post
     
    has_many :followed_relationships, class_name: 'Follower', foreign_key: 'follower_id'
    has_many :following, through: :followed_relationships, source: :followed
  
    has_many :follower_relationships, class_name: 'Follower', foreign_key: 'followed_id'
    has_many :followers, through: :follower_relationships, source: :follower
  
    def follow(profile)
      followed_relationships.create(followed: profile)
    end
  
    def unfollow(profile)
      followed_relationships.where(followed: profile).destroy_all
    end
end
