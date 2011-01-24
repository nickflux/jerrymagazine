class CreateWorks < ActiveRecord::Migration
  def self.up
    create_table :works do |t|
      t.string :type
      t.string :title
      t.text :abstract
      t.text :work_content
      t.integer :edition_id
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :works
  end
end
