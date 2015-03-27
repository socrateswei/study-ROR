class AddUserIdToPlurk < ActiveRecord::Migration
  def change
    add_column :plurks, :user_id, :integer
  end
end
