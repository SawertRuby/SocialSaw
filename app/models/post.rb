class Post < ApplicationRecord
  belongs_to :profile
  has_many_attached :images

end
