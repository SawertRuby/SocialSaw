class AddDeletedAtToComments < ActiveRecord::Migration[7.2]
  def change
    add_column :comments, :deleted_at, :datetime
  end
end
