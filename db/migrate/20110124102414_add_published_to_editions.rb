class AddPublishedToEditions < ActiveRecord::Migration
  def self.up
    add_column :editions, :published, :boolean, :default => false
  end

  def self.down
    remove_column :editions, :published
  end
end