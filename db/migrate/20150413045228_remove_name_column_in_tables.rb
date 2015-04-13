class RemoveNameColumnInTables < ActiveRecord::Migration
  def change
    remove_column :plurks, :name
    remove_column :replies, :name
  end
end
