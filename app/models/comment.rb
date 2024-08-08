class Comment < ApplicationRecord
  belongs_to :profile
  belongs_to :post
  has_many_attached :images

end
