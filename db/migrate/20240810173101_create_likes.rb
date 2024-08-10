class CreateLikes < ActiveRecord::Migration[7.2]
  def change
    create_table :likes do |t|
      t.references :profile, null: false, foreign_key: true
      t.integer :like_type
      t.references :likeable, polymorphic: true, null: false

      t.timestamps
    end

    add_index :likes, [:profile_id, :likeable_type, :likeable_id], unique: true, name: 'index_likes_on_profile_and_likeable'
  end
end
