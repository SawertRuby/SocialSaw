class Post < ApplicationRecord
  belongs_to :profile
  has_many_attached :images
  has_many :comment
  has_many :like, as: :likeable, dependent: :destroy
end
