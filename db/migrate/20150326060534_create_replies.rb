class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.string :name
      t.string :content
      t.integer :plurk_id

      t.timestamps
    end
  end
end
