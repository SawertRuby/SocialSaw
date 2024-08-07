class AddProfileIdToPosts < ActiveRecord::Migration[7.2]
  def change
    add_reference :posts, :profile, null: false, foreign_key: true
  end
end
