class CreatePosts < ActiveRecord::Migration[7.2]
  def change
    create_table :posts do |t|
      t.text :description

      t.timestamps
    end
  end
end
