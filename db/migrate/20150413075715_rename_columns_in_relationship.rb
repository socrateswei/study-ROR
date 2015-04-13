class RenameColumnsInRelationship < ActiveRecord::Migration
  def change
    remove_column :Relationships, :user_id
    remove_column :Relationships, :followed_id
    add_column :Relationships, :follower_id, :integer
    add_column :Relationships, :following_id, :integer
  end
end
