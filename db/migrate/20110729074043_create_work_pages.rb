class CreateWorkPages < ActiveRecord::Migration
  def self.up
    create_table :work_pages do |t|
      t.integer :work_id
      t.integer :page_number
      t.text :page_content

      t.timestamps
    end
  end

  def self.down
    drop_table :work_pages
  end
end
