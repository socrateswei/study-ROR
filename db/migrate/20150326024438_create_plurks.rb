class CreatePlurks < ActiveRecord::Migration
  def change
    create_table :plurks do |t|
      t.string :name
      t.string :content

      t.timestamps
    end
  end
end
