class CreateEditions < ActiveRecord::Migration
  def self.up
    create_table :editions do |t|
      t.string :title
      t.integer :edition_no
      t.date :publish_date
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :editions
  end
end
