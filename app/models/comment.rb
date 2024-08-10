class Comment < ApplicationRecord
  belongs_to :profile
  belongs_to :post
  has_many_attached :images
  has_many :like, as: :likeable, dependent: :destroy


  def deleted?
    deleted_at.present?
  end

  def soft_delete
    update(deleted_at: Time.current)
  end

  def restore
    update(deleted_at: nil)
  end

  scope :active, -> { where(deleted_at: nil) }
end


