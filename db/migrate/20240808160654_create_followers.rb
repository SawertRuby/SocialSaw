class CreateFollowers < ActiveRecord::Migration[7.2]
  def change
    create_table :followers do |t|
      t.references :follower, null: false, foreign_key: { to_table: :profiles }
      t.references :followed, null: false, foreign_key: { to_table: :profiles }

      t.timestamps
    end
  end
end
