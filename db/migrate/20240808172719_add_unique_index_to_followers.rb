class AddUniqueIndexToFollowers < ActiveRecord::Migration[7.2]
  def change
    add_index :followers, [:follower_id, :followed_id], unique: true
  end
end
