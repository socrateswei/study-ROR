class AddIndexUniqForRelationship < ActiveRecord::Migration
  def change
    add_index :relationships, [:user_id, :followed_id], :unique => true
  end
end
