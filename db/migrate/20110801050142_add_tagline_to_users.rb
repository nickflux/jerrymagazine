class AddTaglineToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :tagline, :string
  end

  def self.down
    remove_column :users, :tagline
  end
end